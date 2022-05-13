import 'package:dartz/dartz.dart';

import '../../errors/movieflix_errors.dart';
import '../entities/moviflix_entity.dart';
import '../repositories/movieflix_repository.dart';

abstract class IMovieflixUsecase {
  Future<Either<Exception, MovieflixEntity>> call();
}

class MovieflixUsecase implements IMovieflixUsecase {
  final IMovieflixRepository repository;

  MovieflixUsecase(this.repository);

  @override
  Future<Either<Exception, MovieflixEntity>> call() async {
    try {
      final result = await repository.getTitles();
      return result;
    } on TitleErros catch (e) {
      return Left(e);
    }
  }
}
