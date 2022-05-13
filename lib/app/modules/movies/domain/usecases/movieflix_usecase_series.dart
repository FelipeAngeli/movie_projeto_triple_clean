import 'package:dartz/dartz.dart';

import '../../errors/movieflix_errors.dart';
import '../entities/moviflix_entity.dart';
import '../repositories/movieflix_series_repository.dart';

abstract class IMovieflixUsecaseSeries {
  Future<Either<Exception, MovieflixEntity>> call();
}

class MovieflixUsecaseSeries implements IMovieflixUsecaseSeries {
  final IMovieflixSeriesRepository repository;

  MovieflixUsecaseSeries(this.repository);

  @override
  Future<Either<Exception, MovieflixEntity>> call() async {
    try {
      final result = await repository.getSeries();
      return result;
    } on TitleErros catch (e) {
      return Left(e);
    }
  }
}
