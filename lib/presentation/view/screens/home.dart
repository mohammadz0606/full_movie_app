import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/get_data.dart';
import '../widgets/drawer/navigation_drawer.dart';
import '../widgets/loading.dart';
import '../widgets/tabs/movie_tab.dart';
import '../widgets/top_trending/movie_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GetDataAPIProvider>(
        builder: (context, provider, child) {
          return Visibility(
            visible: !provider.isLoadTrendingMovie,
            replacement: const CustomLinearProgressIndicator(),
            child: Stack(
              fit: StackFit.expand,
              children: [
                FractionallySizedBox(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.58,
                  child: MovieCarouselWidget(
                    defaultIndex: 0,
                    movies: provider.trendingMovie,
                  ),
                ),
                Visibility(
                  visible: !provider.isLoadNowPlayingMovie ||
                      !provider.isLoadComingSoonMovie ||
                      !provider.isLoadPopularMovie,
                  child: const FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.44,
                    child: MovieTabWidget(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      drawer: const CustomNavigationDrawer(),
    );
  }
}
