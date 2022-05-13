import 'package:dartz/dartz.dart';
import '../../domain/entities/moviflix_entity.dart';
import '../../domain/repositories/movieflix_movies_repository.dart';
import '../../errors/movieflix_errors.dart';
import '../datasources/movieflix_movies_datasource.dart';

class MovieflixMoviesRepositoryImpl implements IMovieflixMoviesRepository {
  final IMovieflixMoviesDatasource datasource;

  MovieflixMoviesRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, MovieflixEntity>> getMovies() async {
    try {
      final result = await datasource.getMovies();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    }
  }
}
