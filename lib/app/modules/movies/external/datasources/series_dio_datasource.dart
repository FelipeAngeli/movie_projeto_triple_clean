import 'package:dio/dio.dart';

import '../../errors/movieflix_errors.dart';
import '../../infra/datasources/movieflix_series_datasource.dart';
import '../../infra/models/movieflix_model.dart';

class SeriesDioDatasource implements IMovieflixSeriesDatasource {
  final Dio dio;

  SeriesDioDatasource(this.dio);

  @override
  Future<MovieflixModel> getSeries() async {
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/tv/popular?api_key=086502878a93b8871eace12f457fa1f1');

      return MovieflixModel.fromMap(response.data);
    } on DioError catch (e) {
      throw DioDatasourceErro(
        message: "Error: $e",
      );
    }
  }
}
