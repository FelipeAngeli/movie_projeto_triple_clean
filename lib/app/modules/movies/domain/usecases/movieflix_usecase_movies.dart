import 'package:dartz/dartz.dart';

import '../../errors/movieflix_errors.dart';
import '../entities/moviflix_entity.dart';
import '../repositories/movieflix_movies_repository.dart';

abstract class IMovieflixUsecaseMovies {
  Future<Either<Exception, MovieflixEntity>> call();
}

class MovieflixUsecaseMovies implements IMovieflixUsecaseMovies {
  final IMovieflixMoviesRepository repository;

  MovieflixUsecaseMovies(this.repository);

  @override
  Future<Either<Exception, MovieflixEntity>> call() async {
    try {
      final result = repository.getMovies();
      return result;
    } on TitleErros catch (e) {
      return Left(e);
    }
  }
}
