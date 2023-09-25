import 'package:cinemapedia_dos/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_dos/domain/entities/movie.dart';
import 'package:cinemapedia_dos/domain/repostitories/movies_repositories.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }
}
