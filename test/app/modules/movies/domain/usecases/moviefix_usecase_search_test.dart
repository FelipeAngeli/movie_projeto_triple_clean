import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/movies/domain/entities/moviflix_entity.dart';
import 'package:movie_challenger/app/modules/movies/domain/repositories/movieflix_search_repository.dart';
import 'package:movie_challenger/app/modules/movies/domain/usecases/movieflix_usecase_search.dart';
import 'package:movie_challenger/app/modules/movies/errors/movieflix_errors.dart';

class MoviefixSearchRepositoryMock extends Mock
    implements IMovieflixSearchRepository {}

void main() {
  final repository = MoviefixSearchRepositoryMock();
  final usecase = MovieflixUsecaseSearch(repository);
  final titles = MovieflixEntity(results: []);

  test('Deve retornar minha MovieflixEntity com sucesso', () async {
    when(() => repository.searchTitle(any()))
        .thenAnswer((_) async => Right(titles));
    final result = await usecase("carlos");
    expect(result.fold(id, id), isA<MovieflixEntity>());
  });
  test('Deve retornar um SearchError em casso de erro', () async {
    when(() => repository.searchTitle(any()))
        .thenAnswer((_) async => Right(titles));
    final result = await usecase("");
    expect(result.fold((l) => l, (r) => r), isA<SearchError>());
  });
}
