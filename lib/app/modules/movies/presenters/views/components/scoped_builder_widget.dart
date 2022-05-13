import 'package:flutter/material.dart';

import 'package:flutter_triple/flutter_triple.dart';

import '../../triples/movieflix_states.dart';
import '../../triples/movieflix_store.dart';
import 'custom_title_card.dart';

class ScopedBuilderWidget extends StatelessWidget {
  final MovieflixStore? store;

  const ScopedBuilderWidget({Key? key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<MovieflixStore, Exception, MovieflixSuccess>(
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
