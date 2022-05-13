import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/movies/domain/entities/moviflix_entity.dart';
import 'package:movie_challenger/app/modules/movies/domain/usecases/movieflix_usecase.dart';
import 'package:movie_challenger/app/modules/movies/presenters/triples/movieflix_store.dart';
import 'package:triple_test/triple_test.dart';

class MovieflixUsecaseMock extends Mock implements IMovieflixUsecase {}

void main() {
  final usecase = MovieflixUsecaseMock();
  final titles = MovieflixEntity(results: []);

  storeTest<MovieflixStore>("Deve atualizar o estado em caso de sucesso",
      build: () {
        when(() => usecase.call()).thenAnswer((_) async => Right(titles));
        return MovieflixStore(usecase);
      },
      act: (store) => store.getTitle(),
      expect: () => [
            tripleLoading,
            tripleState,
          ]);
  storeTest<MovieflixStore>("Deve apresentar um erro",
      build: () {
        when(() => usecase.call()).thenAnswer((_) async => Left(Exception()));
        return MovieflixStore(usecase);
      },
      act: (store) => store.getTitle(),
      expect: () => [
            tripleLoading,
            tripleError,
            tripleLoading,
          ]);
}
