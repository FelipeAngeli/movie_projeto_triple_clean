import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/movies/domain/entities/moviflix_entity.dart';
import 'package:movie_challenger/app/modules/movies/domain/repositories/movieflix_repository.dart';
import 'package:movie_challenger/app/modules/movies/domain/usecases/movieflix_usecase.dart';
import 'package:movie_challenger/app/modules/movies/errors/movieflix_errors.dart';

class MoviefixRepositoryMock extends Mock implements IMovieflixRepository {}

void main() {
  final repository = MoviefixRepositoryMock();
  final usecase = MovieflixUsecase(repository);
  final titles = MovieflixEntity(results: []);

  test('Deve retornar a minha MovieflixEntity com sucesso', () async {
    when(() => repository.getTitles()).thenAnswer((_) async => Right(titles));
    final result = await usecase();
    expect(result.fold((l) => l, (r) => r), isA<MovieflixEntity>());
  });
  test('Deve retornar uma Exception<TitleErros> em caso de erro', () async {
    when(() => repository.getTitles()).thenThrow(TitleErros());
    final result = await usecase();
    expect(result.fold((l) => l, (r) => r), isA<TitleErros>());
  });
}
