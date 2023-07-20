import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'movie_card.dart';

class AnimatedMovieCard extends StatelessWidget {
  const AnimatedMovieCard({
    Key? key,
    required this.index,
    required this.movieId,
    required this.posterPath,
    required this.pageController,
  }) : super(key: key);
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1.0;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: Curves.easeIn.transform(value) *
                  (mediaQuery.size.height - mediaQuery.viewPadding.top) *
                  0.35,
              width: 230.w,
              child: child,
            ),
          );
        }
        else {
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                      (mediaQuery.size.height - mediaQuery.viewPadding.top) *
                      0.35,
              width: 230.w,
              child: child,
            ),
          );
        }
      },
      child: MovieCardWidget(
        movieID: movieId,
        imagePath: posterPath,
      ),
    );
  }
}
