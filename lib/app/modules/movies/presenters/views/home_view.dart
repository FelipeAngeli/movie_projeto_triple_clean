import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/categories_controller.dart';
import '../controllers/text_controller.dart';
import '../triples/movies/movieflix_movies_store.dart';
import '../triples/search/movieflix_search_store.dart';
import '../triples/series/movieflix_series_store.dart';
import '../triples/movieflix_store.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_categorie_button.dart';
import 'components/movies_scoped_builder_widget.dart';
import 'components/scoped_builder_widget.dart';
import 'components/series_scoped_builder_widget.dart';

class HomeView extends StatefulWidget {
  final MovieflixSeriesStore seriesStore;

  const HomeView({
    Key? key,
    required this.seriesStore,
  }) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final store = Modular.get<MovieflixStore>();

  late final MovieflixSeriesStore seriesStore;

  final moviesStore = Modular.get<MovieflixMoviesStore>();
  final searchStore = Modular.get<MovieflixSearchStore>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  int _selected = 0;
  String? _text;

  @override
  void initState() {
    super.initState();
    store.getTitle();
    seriesStore = widget.seriesStore;
    seriesStore.getSeries();
    moviesStore.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    final controller = CategoriesController();
    final textController = TextController();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xff171A31),
      drawer: const Drawer(),
      appBar: CustomAppBar(
        onTap: () => _scaffoldKey.currentState?.openDrawer(),
        form: _formKey,
        onChanged: (value) {
          _text = value;
        },
        controller: textController.searchController,
        searchTap: () {
          searchStore.getTitle(textController.searchController.text);
          Modular.to.navigate('/searchView');
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 18, bottom: 10),
              child: Text(
                "Categories",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 25),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    return CustomCategoriesButtom(
                      onTap: () {
                        setState(() {
                          _selected = index;
                        });
                      },
                      color: _selected == index
                          ? const Color(0xff2F40AE)
                          : const Color(0xff0F1122),
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.01,
                      text: controller.categories[index],
                    );
                  }),
            ),
            SizedBox(
              height: 500,
              child: _selected == 0
                  ? ScopedBuilderWidget(
                      store: store,
                    )
                  : _selected == 1
                      ? SeriesScopedBuildWidget(
                          store: seriesStore,
                        )
                      : _selected == 2
                          ? MoviesScopedBuilderWidget(
                              store: moviesStore,
                            )
                          : Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.close,
                                  size: 100,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Nenhum resultado!",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )),
            ),
          ],
        ),
      ),
    );
  }
}
