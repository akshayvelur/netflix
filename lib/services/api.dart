import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/movie.dart';
import 'package:netflix/models/movie_recomention.dart';
import 'package:netflix/models/search_model.dart';
import 'package:netflix/widgets/constant.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _topRateUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

  static const _upComingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  // for search

  static const baseUrl = "https://api.themoviedb.org/3/";
  var key = "?api_key=$apiKey";
  late String endPoint;

  Future<List<Movie>> gettrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happend');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRateUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happend');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happend');
    }
  }

  // search
  Future<SearchModel> getSearchMovies(String searchText) async {
    endPoint = "search/tv?query=$searchText";
    final url = "$baseUrl$endPoint";
    print("search url is $url");
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTAyYjhjMDMxYzc5NzkwZmU1YzBiNGY5NGZkNzcwZCIsInN1YiI6IjYzMmMxYjAyYmE0ODAyMDA4MTcyNjM5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N1SoB26LWgsA33c-5X0DT5haVOD4CfWfRhwpDu9eGkc"
    });
    if (response.statusCode == 200) {
      // print("getnowplay");
      // print("${response.body}");
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("faild to load now searched  movies");
  }

  Future<MovieRecomentation> getPopularMovies() async {
    endPoint = "movie/now_playing";
    final url = "$baseUrl$endPoint$key";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // print("getnowplay");
      // print("${response.body}");
      return MovieRecomentation.fromJson(jsonDecode(response.body));
    }
    throw Exception("faild to load popular  movies");
  }
}
