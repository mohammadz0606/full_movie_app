import 'package:flutter_test/flutter_test.dart';
import 'package:full_movie_app/data/api/get_data.dart';
import 'package:full_movie_app/data/models/movie_details_model.dart';
import 'package:full_movie_app/data/models/movie_model.dart';

void main() {

  GetDataAPI? getDataAPI;

  setUp(() {
    getDataAPI = GetDataAPI();
  });

  group("Get Trending Movie and Details test", () {
    test("Get Done Movie ...", () async{
      final List<MovieModel> movieModel = await getDataAPI!.getTrending();
      expect(movieModel, isA<List<MovieModel>>());
    });


    test("Get Done Details", () async{
      final MovieDetailsModel movieDetailsModel = await getDataAPI!.getMovieDetails(movieID: 27);
      expect(movieDetailsModel, isA<MovieDetailsModel>());
    });
  });

  tearDown(() {
    getDataAPI = null;
  });
}
