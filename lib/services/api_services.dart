import 'dart:convert';
import 'dart:developer';

import 'package:netflix_clone/common/utils.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/models/movie_detailled_model.dart';
import 'package:netflix_clone/models/movie_reccomendation_model.dart';
import 'package:netflix_clone/models/search_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/models/upcoming_model.dart';

const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key=$apiKey';
late String endPoint;

class ApiServices {
  Future<UpcomingMovieModel> getUpcomingMovies() async {
    endPoint = 'movie/upcoming';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("success ");
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load upcoming movies');
  }

  Future<UpcomingMovieModel> getNowplayingMovies() async {
    endPoint = 'movie/upcoming';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("success ");
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<TvSeriesModel> getTopRatedSeries() async {
    endPoint = 'tv/top_rated';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("success ");
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load top rated tv series');
  }

  Future<SearchModel> getSearchedMovie(String searchText) async {
    endPoint = 'search/movie?query=$searchText';
    final url = '$baseUrl$endPoint';

    print("search url is $url");

    final response = await http.get(Uri.parse(url), headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTAyYjhjMDMxYzc5NzkwZmU1YzBiNGY5NGZkNzcwZCIsInN1YiI6IjYzMmMxYjAyYmE0ODAyMDA4MTcyNjM5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N1SoB26LWgsA33c-5X0DT5haVOD4CfWfRhwpDu9eGkc"
    });
    if (response.statusCode == 200) {
      log("success ");
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load top rated searched movie');
  }

  Future<MovieRecommendationModel> getPopularMovies() async {
    endPoint = 'movie/popular';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("success ");
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load popular movies');
  }

  Future<MovieDetailledModel> getMovieDetail(int movieId) async {
    endPoint = 'movie/$movieId';
    final url = '$baseUrl$endPoint$key';

    print("movie url is $url");

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("success ");
      return MovieDetailledModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load top rated movie details movie');
  }

  Future<MovieRecommendationModel> getMovieRecommendation(int movieId) async {
    endPoint = 'movie/$movieId/recommendations';
    final url = '$baseUrl$endPoint$key';

    print("recommendations url is $url");

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("success ");
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to more like this');
  }
}
