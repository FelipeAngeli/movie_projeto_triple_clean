import 'package:dartz/dartz.dart';

import '../entities/moviflix_entity.dart';

abstract class IMovieflixMoviesRepository {
  Future<Either<Exception, MovieflixEntity>> getMovies();
}
