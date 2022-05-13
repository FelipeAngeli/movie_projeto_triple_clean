import 'package:dartz/dartz.dart';

import '../../errors/movieflix_errors.dart';
import '../entities/moviflix_entity.dart';
import '../repositories/movieflix_search_repository.dart';

abstract class IMovieflixUsecaseSearch {
  Future<Either<Exception, MovieflixEntity>> call(String titleText);
}

class MovieflixUsecaseSearch implements IMovieflixUsecaseSearch {
  final IMovieflixSearchRepository repository;

  MovieflixUsecaseSearch(this.repository);

  @override
  Future<Either<Exception, MovieflixEntity>> call(String titleText) async {
    final result = await repository.searchTitle(titleText);
    if (titleText.isEmpty) {
      return Left(SearchError());
    }
    return result;
  }
}
