import 'package:dartz/dartz.dart';

import '../../domain/entities/moviflix_entity.dart';
import '../../domain/repositories/movieflix_search_repository.dart';
import '../../errors/movieflix_errors.dart';
import '../datasources/movieflix_search_datasource.dart';

class MovieflixSearchRepositoryImpl implements IMovieflixSearchRepository {
  final IMovieflixSearchDatasource datasource;

  MovieflixSearchRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, MovieflixEntity>> searchTitle(
      String titleText) async {
    try {
      final result = await datasource.searchTitle(titleText);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    }
  }
}
