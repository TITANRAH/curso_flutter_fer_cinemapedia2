import 'package:cinemapedia_dos/domain/entities/movie.dart';

// la diferencia es que los repositorios llaman al datasource
// si cambiara el origen de datos cambio datasouyrce pero el repositorio no

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
