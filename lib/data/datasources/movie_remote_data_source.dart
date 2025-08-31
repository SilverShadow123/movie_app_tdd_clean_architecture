abstract class MovieRemoteDataSource {
  Future<List<dynamic>> getTrendingMovies();
  Future<List<dynamic>> searchMovies();
  Future<List<dynamic>> getPopularMovies();
}