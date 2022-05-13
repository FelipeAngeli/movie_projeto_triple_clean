import 'package:dartz/dartz.dart';
import '../../domain/entities/moviflix_entity.dart';
import '../../domain/repositories/movieflix_repository.dart';
import '../../errors/movieflix_errors.dart';
import '../datasources/movieflix_datasource.dart';

class MovieflixRepositoryImpl implements IMovieflixRepository {
  final IMovieflixDatasource datasource;

  MovieflixRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, MovieflixEntity>> getTitles() async {
    try {
      final result = await datasource.getTitle();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    }
  }
}
