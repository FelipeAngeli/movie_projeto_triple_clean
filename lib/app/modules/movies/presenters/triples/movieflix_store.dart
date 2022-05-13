import 'package:flutter_triple/flutter_triple.dart';
import '../../domain/entities/moviflix_entity.dart';
import '../../domain/usecases/movieflix_usecase.dart';
import 'movieflix_states.dart';

class MovieflixStore extends StreamStore<Exception, MovieflixSuccess> {
  final IMovieflixUsecase usecase;

  MovieflixStore(this.usecase)
      : super(MovieflixSuccess(MovieflixEntity(results: [])));

  Future<void> getTitle() async {
    setLoading(true);

    final result = await usecase();
    result.fold(
      (l) {
        setError(l);
        setLoading(false);
      },
      (r) => update(
        MovieflixSuccess(r),
      ),
    );
  }
}
