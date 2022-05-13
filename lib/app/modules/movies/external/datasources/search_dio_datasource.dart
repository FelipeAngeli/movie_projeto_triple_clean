import 'package:dio/dio.dart';

import '../../errors/movieflix_errors.dart';
import '../../infra/datasources/movieflix_search_datasource.dart';
import '../../infra/models/movieflix_model.dart';

class SearchDioDatasource implements IMovieflixSearchDatasource {
  final Dio dio;

  SearchDioDatasource(this.dio);

  @override
  Future<MovieflixModel> searchTitle(String titleText) async {
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/search/multi?api_key=086502878a93b8871eace12f457fa1f1&query=$titleText');

      return MovieflixModel.fromMap(response.data);
    } on DioError catch (e) {
      throw DioDatasourceErro(
        message: "Error: $e",
      );
    }
  }
}
