import 'package:dartz/dartz.dart';

import '../entities/moviflix_entity.dart';

abstract class IMovieflixRepository {
  Future<Either<Exception, MovieflixEntity>> getTitles();
}
