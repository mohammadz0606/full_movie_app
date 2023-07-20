import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/movie_model.dart';
import '../../../view_model/get_data.dart';
import '../../screens/details.dart';
import 'animated_movie_card.dart';

class MoviePageView extends StatefulWidget {
  const MoviePageView({
    Key? key,
    required this.movies,
    required this.defaultIndex,
  }) : super(key: key);
  final List<MovieModel> movies;
  final int defaultIndex;

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: widget.defaultIndex,
      keepPage: false,
      viewportFraction: 0.7,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: (mediaQuery.size.height - mediaQuery.viewPadding.top) * 0.35,
      margin: EdgeInsets.symmetric(
        vertical: 15.h,
      ),
      child: Consumer<GetDataAPIProvider>(
        builder: (context, provider, child) {
          return PageView.builder(
            physics: const ClampingScrollPhysics(),
            pageSnapping: true,
            controller: pageController,
            itemCount: widget.movies.length,
            onPageChanged: (value) {
              log("my value in page view $value");
              log(widget.movies[value].backdropPath!);
              provider.setBackgroundImageTrending(
                image: widget.movies[value].backdropPath!,
              );
              provider.setTitleTrendingMovie(
                title: widget.movies[value].title!,
              );
            },
            itemBuilder: (context, index) {
              final movieData = widget.movies[index];
              return AnimatedMovieCard(
                index: index,
                movieId: movieData.id!,
                pageController: pageController,
                posterPath: movieData.posterPath!,
              );
            },
          );
        },
      ),
    );
  }
}
