import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/movies/errors/movieflix_errors.dart';
import 'package:movie_challenger/app/modules/movies/infra/datasources/movieflix_movies_datasource.dart';
import 'package:movie_challenger/app/modules/movies/infra/models/movieflix_model.dart';
import 'package:movie_challenger/app/modules/movies/infra/repositories/movieflix_movies_repository_impl.dart';

class MoviefixMoviesDatasourceMock extends Mock
    implements IMovieflixMoviesDatasource {}

void main() {
  final datasource = MoviefixMoviesDatasourceMock();
  final repository = MovieflixMoviesRepositoryImpl(datasource);
  final movies = MovieflixModel(results: []);

  test('Deve retornar uma instancia do meu MovieflixModel em caso de sucesso',
      () async {
    when(() => datasource.getMovies()).thenAnswer((_) async => movies);
    final result = await repository.getMovies();
    expect(result.fold(id, id), isA<MovieflixModel>());
  });
  test('Deve retornar uma instancia do meu DatasourceError em caso de falha',
      () async {
    when(() => datasource.getMovies()).thenThrow(DatasourceError());
    final result = await repository.getMovies();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
