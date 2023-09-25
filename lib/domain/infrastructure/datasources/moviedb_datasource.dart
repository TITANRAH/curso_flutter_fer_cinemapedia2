import 'package:cinemapedia_dos/config/constants/environment.dart';
import 'package:cinemapedia_dos/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_dos/domain/entities/movie.dart';
import 'package:cinemapedia_dos/domain/infrastructure/mappers/movie_mappers.dart';
import 'package:cinemapedia_dos/domain/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

// aqui implementamos lo quye el datasource pida
// el mencanismo para obtener las listas de peliculas
// ya sea peticion http json lo que sea
class MoviedbDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    // dio siempre response.data
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    // la respuesta trae results que es el arreglo
    // esa respuessta la transformo con fromjason
    // luego tomo el results y mappeo hacia mi entidad para la app
    // las pelis con no-poster no entran
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((movie) => MovieMapper.movieDBtoEntity(movie)).toList();

    return movies;
  }
}
