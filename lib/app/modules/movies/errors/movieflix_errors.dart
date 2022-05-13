abstract class MovieflixErrors implements Exception {}

class TitleErros implements MovieflixErrors {}

class DatasourceError implements MovieflixErrors {}

class DioDatasourceErro implements MovieflixErrors {
  final String message;

  DioDatasourceErro({required this.message});
}

class SearchError implements MovieflixErrors {}
