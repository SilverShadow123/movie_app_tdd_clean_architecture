import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app_tdd_clean_architecture/core/server_exception.dart';
import 'package:movie_app_tdd_clean_architecture/data/models/movie_models.dart';

import '../movie_remote_data_source.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  static const BASE_URL = 'https://api.themoviedb.org/3';
  static const API_KEY = '9af13e5a234ae671bb76cbe828c0f2ed';
  @override
  Future<List> getPopularMovies() async {
 final response = await client.get(Uri.parse('$BASE_URL/movie/popular?api_key=$API_KEY'));
 if(response.statusCode == 200){
   final responseBody = json.decode(response.body);
   final List<MovieModel> movies = (responseBody['results'] as List).map((movie) => MovieModel.fromJson(movie)).toList();
   return movies;
 }else{
   throw ServerException();
 }
  }

  @override
  Future<List> getTrendingMovies() {
    // TODO: implement getTrendingMovies
    throw UnimplementedError();
  }

  @override
  Future<List> searchMovies() {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
  
}