import 'package:cinemapedia_dos/domain/entities/movie.dart';
import 'package:cinemapedia_dos/domain/infrastructure/models/moviedb/movie_moviedb.dart';

// tomar la implementacion de themovie db 
// y transformar a mi entidad
// si por ejemplo cambiara desde la data del endpoint overview a sinopsis 
// mi app seguira funcionando con overview 
// solo tebndria que cambiar aca a moviedb.descripcion

class MovieMapper {
  static Movie movieDBtoEntity(MovieMovieDB moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: (moviedb.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
            : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png',
        // NO PUEDE SER ASIGNADO A STRING UN ENTERO
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: moviedb.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
            : 'no-poster',
        releaseDate: moviedb.releaseDate,
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount,
      );
}
