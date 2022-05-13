import '../../../domain/entities/moviflix_entity.dart';

abstract class MovieflixSearchStates {}

class MovieflixSearchSuccess implements MovieflixSearchStates {
  final MovieflixEntity titles;

  MovieflixSearchSuccess(this.titles);
}
