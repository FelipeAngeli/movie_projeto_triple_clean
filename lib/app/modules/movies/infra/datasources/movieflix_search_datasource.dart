import '../models/movieflix_model.dart';

abstract class IMovieflixSearchDatasource {
  Future<MovieflixModel> searchTitle(String titleText);
}
