import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/movies/domain/entities/moviflix_entity.dart';
import 'package:movie_challenger/app/modules/movies/domain/repositories/movieflix_series_repository.dart';
import 'package:movie_challenger/app/modules/movies/domain/usecases/movieflix_usecase_series.dart';
import 'package:movie_challenger/app/modules/movies/errors/movieflix_errors.dart';

class MoviefixSeriesRepositoryMock extends Mock
    implements IMovieflixSeriesRepository {}

void main() {
  final repository = MoviefixSeriesRepositoryMock();
  final usecase = MovieflixUsecaseSeries(repository);
  final series = MovieflixEntity(results: []);

  test('Deve retornar a minha entidade', () async {
    when(() => repository.getSeries()).thenAnswer((_) async => Right(series));
    final result = await usecase();
    expect(result.fold(id, id), isA<MovieflixEntity>());
  });
  test('Deve retornar uma instancia de TitleErros em caso de falha', () async {
    when(() => repository.getSeries()).thenThrow(TitleErros());
    final result = await usecase();
    expect(result.fold(id, id), isA<TitleErros>());
  });
}
