import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_constant.dart';
import '../custom_api.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';

class GetDataAPI {
  Future<List<MovieModel>> getTrending() async {
    final http.Response response = await CustomAPI.apiGet(
      url:
          "${APIConstants.baseURL}trending/movie/day?language=en-US?api_key=${APIConstants.apiKey}",
    );
    try {
      final responseBody = jsonDecode(response.body);
      final movieResult = (responseBody["results"] as List).map((e) {
        return MovieModel.fromJson(e);
      }).toList();
      return movieResult;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<MovieModel>> getPopular() async {
    final http.Response response = await CustomAPI.apiGet(
      url:
          "${APIConstants.baseURL}movie/popular?language=en-US?api_key=${APIConstants.apiKey}",
    );
    try {
      final responseBody = jsonDecode(response.body);
      final movieResult = (responseBody["results"] as List).map((e) {
        return MovieModel.fromJson(e);
      }).toList();
      return movieResult;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<MovieModel>> getNowPlaying() async {
    final http.Response response = await CustomAPI.apiGet(
      url:
          "${APIConstants.baseURL}movie/now_playing?language=en-US?api_key=${APIConstants.apiKey}",
    );
    try {
      final responseBody = jsonDecode(response.body);
      final movieResult = (responseBody["results"] as List).map((e) {
        return MovieModel.fromJson(e);
      }).toList();
      return movieResult;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<MovieModel>> getComingSoon() async {
    final http.Response response = await CustomAPI.apiGet(
      url:
          "${APIConstants.baseURL}movie/upcoming?language=en-US?api_key=${APIConstants.apiKey}",
    );
    try {
      final responseBody = jsonDecode(response.body);
      final movieResult = (responseBody["results"] as List).map((e) {
        return MovieModel.fromJson(e);
      }).toList();
      return movieResult;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MovieDetailsModel> getMovieDetails({
    required int movieID,
  }) async{

    final http.Response response = await CustomAPI.apiGet(
      url:
      "${APIConstants.baseURL}movie/$movieID?language=en-US?api_key=${APIConstants.apiKey}",
    );
    try {
      final responseBody = jsonDecode(response.body);
      return  MovieDetailsModel.fromJson(responseBody);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
