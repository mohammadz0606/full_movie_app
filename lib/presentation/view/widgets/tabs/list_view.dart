import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/movie_model.dart';
import 'tab_card.dart';

class ListViewOfTab extends StatelessWidget {
  const ListViewOfTab({
    Key? key,
    required this.movies,
  }) : super(key: key);
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 6.w),
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TabCardWidget(
            posterPath: movies[index].posterPath!,
            movieID: movies[index].id!,
            title: movies[index].title!,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 14.w);
        },
        itemCount: movies.length,
      ),
    );
  }
}
