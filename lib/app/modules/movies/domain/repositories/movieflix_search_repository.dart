import 'package:dartz/dartz.dart';

import '../entities/moviflix_entity.dart';

abstract class IMovieflixSearchRepository {
  Future<Either<Exception, MovieflixEntity>> searchTitle(String titleText);
}
