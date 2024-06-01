import 'dart:convert';

import 'package:netflix/common/utils.dart';
import 'package:netflix/models/up_comming_Model.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apiKey";
late String endPoint;

class Apiservices {
  Future<UpCommingMovieModel> getUpcomingMovies() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";
    final response = await http.get(Uri.parse(url));
    print("Upcoming");
    if (response.statusCode == 200) {
      // print("${response.body}");
      return UpCommingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("faild to load upcoming movies");
  }

  Future<UpCommingMovieModel> getNowPlayingMovies() async {
    endPoint = "movie/now_playing";
    final url = "$baseUrl$endPoint$key";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // print("getnowplay");
      // print("${response.body}");
      return UpCommingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("faild to load now Playing  movies");
  }
}
