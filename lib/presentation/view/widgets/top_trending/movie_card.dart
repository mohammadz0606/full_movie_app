import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/api_constant.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieID;
  final String imagePath;

  const MovieCardWidget({
    Key? key,
    required this.movieID,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16.r),
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: FadeInImage(
          placeholder: const AssetImage("assets/pngs/tmdb_logo.png"),
          fit: BoxFit.cover,
          placeholderFit: BoxFit.cover,
          image: NetworkImage(
            "${APIConstants.baseImageURL}$imagePath",
          ),
        ),
      ),
    );
  }
}
