import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/api_constant.dart';

class TabCardWidget extends StatelessWidget {
  const TabCardWidget({
    Key? key,
    required this.movieID,
    required this.title,
    required this.posterPath,
  }) : super(key: key);
  final int movieID;
  final String title, posterPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: FadeInImage(
                placeholderFit: BoxFit.cover,
                placeholder: const AssetImage("assets/pngs/tmdb_logo.png"),
                fit: BoxFit.cover,
                image: NetworkImage(
                  "${APIConstants.baseImageURL}$posterPath",
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              title.length > 15? "${title.substring(0,15)}..." : title,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ),
        ],
      ),
    );
  }
}
