import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/movies/domain/entities/moviflix_entity.dart';
import 'package:movie_challenger/app/modules/movies/domain/repositories/movieflix_movies_repository.dart';
import 'package:movie_challenger/app/modules/movies/domain/usecases/movieflix_usecase_movies.dart';
import 'package:movie_challenger/app/modules/movies/errors/movieflix_errors.dart';

class MoviefixMoviesRepositoryMock extends Mock
    implements IMovieflixMoviesRepository {}

void main() {
  final repository = MoviefixMoviesRepositoryMock();
  final usecase = MovieflixUsecaseMovies(repository);
  final movies = MovieflixEntity(results: []);

  test('Deve retornar uma instancia de MovieflixEntity em caso de sucesso',
      () async {
    when(() => repository.getMovies()).thenAnswer((_) async => Right(movies));
    final result = await usecase();
    expect(result.fold(id, id), isA<MovieflixEntity>());
  });
  test('Deve retornar uma instancia de TitleErros em caso de falha', () async {
    when(() => repository.getMovies()).thenThrow(TitleErros());
    final result = await usecase();
    expect(result.fold(id, id), isA<TitleErros>());
  });
}
