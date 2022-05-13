import '../../domain/entities/moviflix_entity.dart';

abstract class MovieflixStates {}

class MovieflixSuccess implements MovieflixStates {
  final MovieflixEntity titles;
  MovieflixSuccess(this.titles);
}
