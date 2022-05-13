import '../models/movieflix_model.dart';

abstract class IMovieflixMoviesDatasource {
  Future<MovieflixModel> getMovies();
}
