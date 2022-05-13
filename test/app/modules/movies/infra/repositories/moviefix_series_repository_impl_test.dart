import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/movies/errors/movieflix_errors.dart';
import 'package:movie_challenger/app/modules/movies/infra/datasources/movieflix_series_datasource.dart';
import 'package:movie_challenger/app/modules/movies/infra/models/movieflix_model.dart';
import 'package:movie_challenger/app/modules/movies/infra/repositories/movieflix_series_repository_impl.dart';

class MoviefixSeriesDatasourceMock extends Mock
    implements IMovieflixSeriesDatasource {}

void main() {
  final datasource = MoviefixSeriesDatasourceMock();
  final repository = MovieflixSeriesRepositoryImpl(datasource);
  final series = MovieflixModel(results: []);

  test('Deve retorar um instancia do meu MovieflixModel em caso de sucesso',
      () async {
    when(() => datasource.getSeries()).thenAnswer((_) async => series);
    final result = await repository.getSeries();
    expect(result.fold(id, id), isA<MovieflixModel>());
  });
  test('Deve retorar um instancia do meu DatasourceError em caso de falha',
      () async {
    when(() => datasource.getSeries()).thenThrow(DatasourceError());
    final result = await repository.getSeries();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
