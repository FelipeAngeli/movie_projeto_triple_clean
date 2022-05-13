import 'dart:convert';

import '../../domain/entities/results_entity.dart';
import '../../domain/entities/moviflix_entity.dart';

class MovieflixModel implements MovieflixEntity {
  @override
  final List<ResultEntity> results;

  MovieflixModel({required this.results});

  Map<String, dynamic> toMap() {
    return {
      'results': results,
    };
  }

  factory MovieflixModel.fromMap(Map<String, dynamic> map) {
    return MovieflixModel(
      results: List<ResultEntity>.from(
        map['results'].map(
          (e) => ResultEntity(
            title: e['title'] ?? e['original_name'] ?? "",
            backDropPath: e['backdrop_path'] ?? "",
            voteAverage: e['vote_average'].toDouble() ?? 0,
            mediaType: e['media_type'] ?? "",
            language: e['original_language'] ?? "",
            overview: e['overview'] ?? "",
          ),
        ),
      ).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieflixModel.fromJson(String source) =>
      MovieflixModel.fromMap(json.decode(source));
}
