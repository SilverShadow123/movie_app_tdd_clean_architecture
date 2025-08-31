import 'package:movie_app_tdd_clean_architecture/domain/entites/movie.dart';
import 'package:movie_app_tdd_clean_architecture/domain/repositories/movie_repository.dart';

class GetTrendingMovies {
  final MovieRepository repository;
  GetTrendingMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getTrendingMovies();
  }
}