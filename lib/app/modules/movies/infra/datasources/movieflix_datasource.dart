import '../models/movieflix_model.dart';

abstract class IMovieflixDatasource {
  Future<MovieflixModel> getTitle();
}
