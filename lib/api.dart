 import 'dart:convert';
 import 'package:my_first_flutter/constants.dart';
 import 'package:my_first_flutter/model.dart';
 import 'package:http/http.dart' as http;

 class Api{
   static final  _trendingUrl = "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";
   static final  _popularUrl ='https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';
   static final  _upcomingUrl ='https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
   static final  _topRatedUrl ='https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

   Future< List<Movie>> getTrendingMovies () async{
    final response = await http.get( Uri.parse(_trendingUrl));
    if (response.statusCode==200){
       final decodedData = json.decode(response.body)["results"]as List;
       return decodedData.map((movie) => Movie.fromJson(movie)).toList();
   } else {
       throw Exception("Something unexpected occurred");
     }
   }

   Future< List<Movie>> getPopularMovies () async{
     final response = await http.get( Uri.parse(_popularUrl));
     if (response.statusCode==200){
       final decodedData = json.decode(response.body)["results"]as List;
       return decodedData.map((movie) => Movie.fromJson(movie)).toList();
     } else {
       throw Exception("Something unexpected occurred");
     }
   }

   Future< List<Movie>> getUpcomingMovies () async{
     final response = await http.get( Uri.parse(_upcomingUrl));
     if (response.statusCode==200){
       final decodedData = json.decode(response.body)["results"]as List;
       return decodedData.map((movie) => Movie.fromJson(movie)).toList();
     } else {
       throw Exception("Something unexpected occurred");
     }
   }


   Future<List<Cast>> getCast (movieId) async {
     final response = await http.get(
         Uri.parse('https://api.themoviedb.org/3/movie/$movieId/credits?api_key=${Constants.apiKey}'));
     if (response.statusCode==200){
       final decodedData = json.decode(response.body)["cast"] as List;
       print(decodedData);
       return decodedData.map((casts) => Cast.fromJson(casts)).toList();
     } else {
       throw Exception('Something unexpected occurred');
     }
   }

   Future< List<Movie>> getTopRatedMovies () async{
     final response = await http.get( Uri.parse(_topRatedUrl));
     if (response.statusCode==200){
       final decodedData = json.decode(response.body)["results"]as List;
       return decodedData.map((movie) => Movie.fromJson(movie)).toList();
     } else {
       throw Exception("Something unexpected occurred");
     }
  }
}