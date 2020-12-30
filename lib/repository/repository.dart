import 'package:dio/dio.dart';
import 'package:movie_app/model/genre_response.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/model/person_response.dart';

class MovieRepository{

  final String apiKey = "";
  static String mainURL = "https://api.themoviedb.org/3";
  final Dio _dio = Dio(); // esto es envez del http lib

  var getPopularUrl = '$mainURL/movie/top_rated';
  var getMoviesUrl = '$mainURL/discover/top_rated';
  var getPlayingUrl = '$mainURL/movie/now_playing';
  var getGenresUrl = '$mainURL/genre/movie/list';
  var getPersonsUrl = '$mainURL/trending/person/week';

  Future<MovieResponse> getMovies() async{
    var params = {
      "api_key": apiKey,
      "languaje": "en-US",
      "page": 1
    };
    try{
      Response response = await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception ocurred: $error stackTrace : $stacktrace");
      return MovieResponse.withError('$error');
    }
  }

  Future<MovieResponse> getPlayingMovies() async{
    var params = {
      "api_key": apiKey,
      "languaje": "en-US",
      "page": 1
    };
    try{
      Response response = await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception ocurred: $error stackTrace : $stacktrace");
      return MovieResponse.withError('$error');
    }
  }

  Future<GenreResponse> getGenres() async{
    var params = {
      "api_key": apiKey,
      "languaje": "en-US",
      "page": 1
    };
    try{
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception ocurred: $error stackTrace : $stacktrace");
      return GenreResponse.withError('$error');
    }
  }

  Future<PersonResponse> getPersons() async{
    var params = {
      "api_key": apiKey,
      //"languaje": "en-US",
      //"page": 1
    };
    try{
      Response response = await _dio.get(getPersonsUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception ocurred: $error stackTrace : $stacktrace");
      return PersonResponse.withError('$error');
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async{
    var params = {
      "api_key": apiKey,
      "languaje": "en-US",
      "page": 1,
      "with_genres": id
    };
    try{
      Response response = await _dio.get(getPersonsUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception ocurred: $error stackTrace : $stacktrace");
      return MovieResponse.withError('$error');
    }
  }


}