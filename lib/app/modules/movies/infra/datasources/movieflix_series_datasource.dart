import '../models/movieflix_model.dart';

abstract class IMovieflixSeriesDatasource {
  Future<MovieflixModel> getSeries();
}
