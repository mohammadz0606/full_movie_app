import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../view_model/get_data.dart';
import 'list_view.dart';
import 'tab_title.dart';

class MovieTabWidget extends StatelessWidget {
  const MovieTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Consumer<GetDataAPIProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: List.generate(
                  provider.movieTabs.length,
                  (index) {
                    return TabTitleWidget(
                      title: provider.movieTabs[index].title,
                      onTab: () {
                        provider.changeCurrentTabIndex(index: index);
                      },
                      isSelected: index == provider.currentTabIndex,
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: ListViewOfTab(
                  movies: provider.currentTabIndex == 0
                      ? provider.popularMovie
                      : provider.currentTabIndex == 1
                          ? provider.nowPlayingMovie
                          : provider.comingSoonMovie,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
