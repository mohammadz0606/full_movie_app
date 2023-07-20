import 'package:flutter/material.dart';

import '../../../../data/models/movie_model.dart';
import '../movie_app_bar.dart';
import '../separator.dart';
import 'movie_background.dart';
import 'movie_data.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  const MovieCarouselWidget({
    Key? key,
    required this.movies,
    required this.defaultIndex,
  }) : super(key: key);

  final List<MovieModel> movies;
  final int defaultIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackgroundWidget(),
        Column(
          children: [
            const MovieAppBar(),
            MoviePageView(
              defaultIndex: defaultIndex,
              movies: movies,
            ),
            const MovieDataWidget(),
            const CustomSeparator(),
          ],
        ),
      ],
    );
  }
}
