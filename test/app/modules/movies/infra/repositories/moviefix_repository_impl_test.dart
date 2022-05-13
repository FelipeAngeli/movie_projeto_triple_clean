import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/movies/domain/entities/moviflix_entity.dart';
import 'package:movie_challenger/app/modules/movies/errors/movieflix_errors.dart';
import 'package:movie_challenger/app/modules/movies/infra/datasources/movieflix_datasource.dart';
import 'package:movie_challenger/app/modules/movies/infra/models/movieflix_model.dart';
import 'package:movie_challenger/app/modules/movies/infra/repositories/movieflix_repository_impl.dart';

class MoviefixDatasourceMock extends Mock implements IMovieflixDatasource {}

void main() {
  final datasource = MoviefixDatasourceMock();
  final repository = MovieflixRepositoryImpl(datasource);
  final title = MovieflixModel(results: []);

  test('Deve retorar o meu MovieflixEntity sem erro', () async {
    when(() => datasource.getTitle()).thenAnswer((_) async => title);
    final result = await repository.getTitles();
    expect(result.fold((l) => l, (r) => r), isA<MovieflixEntity>());
  });
  test('Deve retorar um DatasourceError', () async {
    when(() => datasource.getTitle()).thenThrow(DatasourceError());
    final result = await repository.getTitles();
    expect(result.fold((l) => l, (r) => r), isA<DatasourceError>());
  });
}
