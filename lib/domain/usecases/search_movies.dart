import 'package:movie_app_tdd_clean_architecture/domain/entites/movie.dart';
import 'package:movie_app_tdd_clean_architecture/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;
  SearchMovies(this.repository);

  Future<List<Movie>> call(String query) async {
    return await repository.searchMovies(query);
  }
}