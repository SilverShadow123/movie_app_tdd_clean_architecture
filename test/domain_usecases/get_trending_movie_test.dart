import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_tdd_clean_architecture/domain/entites/movie.dart';
import 'package:movie_app_tdd_clean_architecture/domain/repositories/movie_repository.dart';
import 'package:movie_app_tdd_clean_architecture/domain/usecases/get_trending_movies.dart';

import 'get_trending_movie_test.mocks.dart';


@GenerateNiceMocks([MockSpec<MovieRepository>()])

void main(){
 late GetTrendingMovies usecase;
 late MockMovieRepository mockMovieRepository;

  setUp((){
    mockMovieRepository = MockMovieRepository();
    usecase = GetTrendingMovies(mockMovieRepository);
  });

 final tMovieList = [
   Movie(id: 1, title: 'Test Movie 1', overview: 'Desc 1', posterPath: '/image1', releaseDate: '2025-07-29', voteAverage: 4.317),
    Movie(id: 2, title: 'Test Movie 2', overview: 'Desc 2', posterPath: '/image2', releaseDate: '2025-07-30', voteAverage: 5.123),
  ];

  test('should get list of movies from the repository', () async {
    when(mockMovieRepository.getTrendingMovies()).thenAnswer((_) async =>tMovieList);

    final reasult = await usecase();

    expect(reasult, tMovieList);
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}