import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../data/api_constant.dart';
import '../../../view_model/get_data.dart';

class MovieBackgroundWidget extends StatelessWidget {
  const MovieBackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.r),
        ),
        child: Stack(
          children: [
            Consumer<GetDataAPIProvider>(
              builder: (context, provider, child) {
                return FractionallySizedBox(
                  heightFactor: 1,
                  widthFactor: 1,
                  child: FadeInImage(
                    placeholderFit: BoxFit.cover,
                    placeholder: const AssetImage("assets/pngs/tmdb_logo.png"),
                    fit: BoxFit.fitHeight,
                    image: provider.backgroundImageTrending == null
                        ? NetworkImage(
                            "${APIConstants.baseImageURL}${provider.trendingMovie[0].backdropPath!}",
                          )
                        : NetworkImage(
                            "${APIConstants.baseImageURL}${provider.backgroundImageTrending!}",
                          ),
                  ),
                );
              },
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
