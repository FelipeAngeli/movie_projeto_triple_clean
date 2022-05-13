import 'package:dio/dio.dart';
import '../../errors/movieflix_errors.dart';
import '../../infra/datasources/movieflix_movies_datasource.dart';
import '../../infra/models/movieflix_model.dart';

class MoviesDioDatasource implements IMovieflixMoviesDatasource {
  final Dio dio;

  MoviesDioDatasource(this.dio);

  @override
  Future<MovieflixModel> getMovies() async {
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/movie/popular?api_key=086502878a93b8871eace12f457fa1f1');

      return MovieflixModel.fromMap(response.data);
    } on DioError catch (e) {
      throw DioDatasourceErro(
        message: "Error: $e",
      );
    }
  }
}
