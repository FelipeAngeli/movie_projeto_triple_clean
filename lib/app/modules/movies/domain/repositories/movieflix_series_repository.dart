import 'package:dartz/dartz.dart';

import '../entities/moviflix_entity.dart';

abstract class IMovieflixSeriesRepository {
  Future<Either<Exception, MovieflixEntity>> getSeries();
}
