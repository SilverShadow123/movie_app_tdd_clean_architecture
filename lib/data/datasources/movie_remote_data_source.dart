import 'package:movie_app_tdd_clean_architecture/data/models/movie_models.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> searchMovies();
  Future<List<MovieModel>> getPopularMovies();
}