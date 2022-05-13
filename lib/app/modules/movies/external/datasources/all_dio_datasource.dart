import 'package:dio/dio.dart';
import '../../errors/movieflix_errors.dart';
import '../../infra/datasources/movieflix_datasource.dart';
import '../../infra/models/movieflix_model.dart';

class AllDioDatasource implements IMovieflixDatasource {
  final Dio dio;

  AllDioDatasource(this.dio);

  @override
  Future<MovieflixModel> getTitle() async {
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/trending/all/week?api_key=086502878a93b8871eace12f457fa1f1');

      return MovieflixModel.fromMap(response.data);
    } on DioError catch (e, s) {
      throw DioDatasourceErro(
        message: "Error: ${e.response?.statusCode}",
      );
    }
  }
}
