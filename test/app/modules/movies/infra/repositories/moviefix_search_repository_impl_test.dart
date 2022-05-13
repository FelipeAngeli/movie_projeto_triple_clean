import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/movies/domain/entities/moviflix_entity.dart';
import 'package:movie_challenger/app/modules/movies/errors/movieflix_errors.dart';
import 'package:movie_challenger/app/modules/movies/infra/datasources/movieflix_search_datasource.dart';
import 'package:movie_challenger/app/modules/movies/infra/models/movieflix_model.dart';
import 'package:movie_challenger/app/modules/movies/infra/repositories/movieflix_search_repository_impl.dart';

class MoviefixSearchDatasourceMock extends Mock
    implements IMovieflixSearchDatasource {}

void main() {
  final datasource = MoviefixSearchDatasourceMock();
  final repository = MovieflixSearchRepositoryImpl(datasource);
  final titles = MovieflixModel(results: []);
  test('Deve retornar o meu MovieflixEntity sem erro', () async {
    when(() => datasource.searchTitle(any())).thenAnswer((_) async => titles);
    final result = await repository.searchTitle("Arrow");
    expect(result.fold(id, id), isA<MovieflixEntity>());
  });
  test('Deve retornar um DatasourceError', () async {
    when(() => datasource.searchTitle(any())).thenThrow(DatasourceError());
    final result = await repository.searchTitle("");
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
