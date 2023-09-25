// aqui defino los metodos o clases para traer la data
// independiente de donde venga la data

import '../entities/movie.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
