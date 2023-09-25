import 'package:cinemapedia_dos/domain/entities/movie.dart';
import 'package:cinemapedia_dos/domain/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia_dos/domain/infrastructure/repositories/movie_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_provider.g.dart';

@Riverpod(keepAlive: true)
class Movies extends _$Movies {
  int currentPage = 0;
  final impl = MovieRepositoryImpl(MoviedbDatasource());

  @override
  List<Movie> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    currentPage++;
    final movies = await impl.getNowPlaying(page: currentPage);
    state = [...state, ...movies];
  }
}
