import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/entities/moviflix_entity.dart';
import '../../../domain/usecases/movieflix_usecase_search.dart';
import 'movieflix_search_states.dart';

class MovieflixSearchStore
    extends StreamStore<Exception, MovieflixSearchSuccess> {
  final IMovieflixUsecaseSearch usecase;

  MovieflixSearchStore(this.usecase)
      : super(MovieflixSearchSuccess(MovieflixEntity(results: [])));

  Future<void> getTitle(String searchText) async {
    setLoading(true);
    final result = await usecase(searchText);
    result.fold((l) {
      setError(l);
      setLoading(false);
    }, (r) => update(MovieflixSearchSuccess(r)));
  }
}
