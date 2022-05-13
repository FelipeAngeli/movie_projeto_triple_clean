import 'package:dartz/dartz.dart';
import '../../domain/entities/moviflix_entity.dart';
import '../../domain/repositories/movieflix_series_repository.dart';
import '../../errors/movieflix_errors.dart';
import '../datasources/movieflix_series_datasource.dart';

class MovieflixSeriesRepositoryImpl implements IMovieflixSeriesRepository {
  final IMovieflixSeriesDatasource datasource;

  MovieflixSeriesRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, MovieflixEntity>> getSeries() async {
    try {
      final result = await datasource.getSeries();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    }
  }
}
