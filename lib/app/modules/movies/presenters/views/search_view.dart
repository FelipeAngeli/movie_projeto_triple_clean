import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../triples/search/movieflix_search_states.dart';
import '../triples/search/movieflix_search_store.dart';
import 'components/custom_title_card.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171A31),
      body: SafeArea(
        child: ScopedBuilder<MovieflixSearchStore, Exception,
            MovieflixSearchSuccess>(
          onError: (_, Exception? e) => Text("Deu ruim $e"),
          onLoading: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          onState: (_, MovieflixSearchSuccess state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                        onTap: () {
                          Modular.to.navigate(Modular.initialRoute);
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Search result",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.titles.results.length,
                      itemBuilder: (context, index) {
                        return CustomTitleCards(
                            favoriteButton: () {
                              setState(() {
                                _isFavorite = !_isFavorite;
                              });
                            },
                            favoriteIcon: _isFavorite == false
                                ? Icons.favorite_border
                                : Icons.favorite,
                            height: 150,
                            result: state.titles.results[index]);
                      }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
