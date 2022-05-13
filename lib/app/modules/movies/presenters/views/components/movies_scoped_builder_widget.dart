import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../triples/movies/movieflix_movies_store.dart';
import '../../triples/movieflix_states.dart';
import 'custom_title_card.dart';

class MoviesScopedBuilderWidget extends StatelessWidget {
  final MovieflixMoviesStore? store;

  const MoviesScopedBuilderWidget({Key? key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<MovieflixMoviesStore, Exception, MovieflixSuccess>(
      store: store,
      onError: (_, Exception? e) => Text("Deu ruim $e"),
      onLoading: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
      onState: (_, MovieflixSuccess state) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: state.titles.results.length,
          itemBuilder: (context, index) {
            return CustomTitleCards(
                onTap: () {}, height: 150, result: state.titles.results[index]);
          },
        );
      },
    );
  }
}
