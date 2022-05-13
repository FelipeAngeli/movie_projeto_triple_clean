import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/movieflix_usecase.dart';
import 'domain/usecases/movieflix_usecase_movies.dart';
import 'domain/usecases/movieflix_usecase_search.dart';
import 'domain/usecases/movieflix_usecase_series.dart';
import 'external/datasources/all_dio_datasource.dart';
import 'external/datasources/movies_dio_datasource.dart';
import 'external/datasources/search_dio_datasource.dart';
import 'external/datasources/series_dio_datasource.dart';
import 'infra/repositories/movieflix_movies_repository_impl.dart';
import 'infra/repositories/movieflix_repository_impl.dart';
import 'infra/repositories/movieflix_search_repository_impl.dart';
import 'infra/repositories/movieflix_series_repository_impl.dart';
import 'presenters/triples/movies/movieflix_movies_store.dart';
import 'presenters/triples/search/movieflix_search_store.dart';
import 'presenters/triples/series/movieflix_series_store.dart';
import 'presenters/triples/movieflix_store.dart';
import 'presenters/views/search_view.dart';
import 'presenters/views/home_view.dart';

class MovieflixModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => MovieflixSearchStore(i())),
    Bind((i) => Dio()),
    Bind((i) => AllDioDatasource(i())),
    Bind((i) => MovieflixRepositoryImpl(i())),
    Bind((i) => MovieflixUsecase(i())),
    Bind((i) => SearchDioDatasource(i())),
    Bind((i) => MovieflixSearchRepositoryImpl(i())),
    Bind((i) => MovieflixUsecaseSearch(i())),
    Bind((i) => MovieflixStore(i())),
    Bind((i) => MovieflixUsecaseSeries(i())),
    Bind((i) => MovieflixSeriesRepositoryImpl(i())),
    Bind((i) => SeriesDioDatasource(i())),
    Bind((i) => MovieflixSeriesStore(i())),
    Bind((i) => MovieflixUsecaseMovies(i())),
    Bind((i) => MovieflixMoviesRepositoryImpl(i())),
    Bind((i) => MoviesDioDatasource(i())),
    Bind((i) => MovieflixMoviesStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => HomeView(
              seriesStore: context.read(),
            )),
    ChildRoute('/searchView', child: (_, args) => const SearchView()),
  ];
}
