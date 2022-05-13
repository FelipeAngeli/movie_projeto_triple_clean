import 'package:flutter_triple/flutter_triple.dart';
import '../../../domain/entities/moviflix_entity.dart';
import '../../../domain/usecases/movieflix_usecase_movies.dart';
import '../movieflix_states.dart';

class MovieflixMoviesStore extends StreamStore<Exception, MovieflixSuccess> {
  final IMovieflixUsecaseMovies usecase;

  MovieflixMoviesStore(this.usecase)
      : super(MovieflixSuccess(MovieflixEntity(results: [])));

  Future<void> getMovies() async {
    setLoading(true);

    final result = await usecase();
    result.fold((l) {
      setError(l);
      setLoading(false);
    }, (r) => update(MovieflixSuccess(r)));
  }
}
