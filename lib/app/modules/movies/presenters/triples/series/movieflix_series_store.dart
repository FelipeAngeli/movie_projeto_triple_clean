import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/entities/moviflix_entity.dart';
import '../../../domain/usecases/movieflix_usecase_series.dart';
import '../movieflix_states.dart';

class MovieflixSeriesStore extends StreamStore<Exception, MovieflixSuccess> {
  final IMovieflixUsecaseSeries usecase;

  MovieflixSeriesStore(this.usecase)
      : super(MovieflixSuccess(MovieflixEntity(results: [])));

  Future<void> getSeries() async {
    setLoading(true);

    final result = await usecase();
    result.fold((l) {
      setError(l);
      setLoading(false);
    }, (r) => update(MovieflixSuccess(r)));
  }
}
