import 'package:movie_app_tdd_clean_architecture/domain/entites/movie.dart';

abstract class MovieRepository {
 Future<List<Movie>> getTrendingMovies();
 Future<List<Movie>> searchMovies(String query);
 Future<List<Movie>> getPopularMovies();
}