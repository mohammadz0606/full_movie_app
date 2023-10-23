import 'dart:developer';

import 'package:flutter/material.dart';

import '../../data/api/get_data.dart';
import '../../data/models/movie_details_model.dart';
import '../../data/models/movie_model.dart';
import '../../data/models/tab.dart';
import '../../helper/languages/translation_constants.dart';
import '../../result.dart';

class GetDataAPIProvider extends ChangeNotifier {
  final GetDataAPI _getDataAPI = GetDataAPI();

  List<MovieModel> trendingMovie = [];
  List<MovieModel> popularMovie = [];
  List<MovieModel> nowPlayingMovie = [];
  List<MovieModel> comingSoonMovie = [];

  bool isLoadTrendingMovie = false;
  bool isLoadPopularMovie = false;
  bool isLoadNowPlayingMovie = false;
  bool isLoadComingSoonMovie = false;

  String? backgroundImageTrending;
  String? titleTrendingMovie;

  int currentTabIndex = 0;
  List<TabMovies> movieTabs = const [
    TabMovies(index: 0, title: TranslationConstants.popular),
    TabMovies(index: 1, title: TranslationConstants.now),
    TabMovies(index: 2, title: TranslationConstants.soon),
  ];

  MovieDetailsModel? movieDetailsModel;

  void getTrending() async {
    isLoadTrendingMovie = true;
    notifyListeners();
    trendingMovie = await _getDataAPI.getTrending();
    isLoadTrendingMovie = false;
    notifyListeners();
  }

  ///Result class lets you handle the result of any async operation in a better way
  Result<List<MovieModel>, Exception> result = Result<List<MovieModel>, Exception>();
  Future<void> getPopularMovies() async{
    var x = result.compute(() async => await _getDataAPI.getPopular());
    notifyListeners();
    result = await x;
    notifyListeners();
  }
  void getPopular() async {
    isLoadPopularMovie = true;
    notifyListeners();
    popularMovie = await _getDataAPI.getPopular();
    isLoadPopularMovie = false;
    notifyListeners();
  }

  void getNowPlaying() async {
    isLoadNowPlayingMovie = true;
    notifyListeners();
    nowPlayingMovie = await _getDataAPI.getNowPlaying();
    isLoadNowPlayingMovie = false;
    notifyListeners();
  }

  void getComingSoon() async {
    isLoadComingSoonMovie = true;
    notifyListeners();
    comingSoonMovie = await _getDataAPI.getComingSoon();
    isLoadComingSoonMovie = false;
    notifyListeners();
  }

  void setBackgroundImageTrending({
    required String image,
  }) {
    if (backgroundImageTrending == null) {
      backgroundImageTrending = trendingMovie[1].backdropPath!;
    } else {
      backgroundImageTrending = image;
    }

    notifyListeners();
  }

  void setTitleTrendingMovie({
    required String title,
  }) {
    if (titleTrendingMovie == null) {
      titleTrendingMovie = trendingMovie[1].title!;
    } else {
      titleTrendingMovie = title;
    }
    notifyListeners();
  }

  void changeCurrentTabIndex({
    required int index,
  }) {
    currentTabIndex = index;
    notifyListeners();
  }
}
