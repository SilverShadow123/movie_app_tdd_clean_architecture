
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_tdd_clean_architecture/domain/entites/movie.dart';
import 'package:movie_app_tdd_clean_architecture/domain/repositories/movie_repository.dart';
import 'package:movie_app_tdd_clean_architecture/domain/usecases/search_movies.dart';

import 'get_trending_movie_test.mocks.dart';



@GenerateMocks([MovieRepository])

void main(){
  late SearchMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp((){
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovies(mockMovieRepository);
  });
  final tQuery = 'Inception';
  final tMovieList = [
    Movie(id: 1, title: 'Test Movie 1', overview: 'Desc 1', posterPath: '/image1', releaseDate: '2025-07-29', voteAverage: 4.317),
    Movie(id: 2, title: 'Test Movie 2', overview: 'Desc 2', posterPath: '/image2', releaseDate: '2025-07-30', voteAverage: 5.123),
  ];

  test('sould get movies from query from repository',() async{
    when(mockMovieRepository.searchMovies(any)).thenAnswer((_) async => tMovieList);
    final result = await usecase.call(tQuery);
    expect(result, tMovieList);
    verify(mockMovieRepository.searchMovies(tQuery));
    verifyNoMoreInteractions(mockMovieRepository);
  });

}