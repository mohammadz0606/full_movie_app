import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../view_model/get_data.dart';

class MovieDataWidget extends StatelessWidget {
  const MovieDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GetDataAPIProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Text(
            provider.titleTrendingMovie == null
                ? provider.trendingMovie[0].title!
                : provider.titleTrendingMovie!,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        );
      },
    );
  }
}
