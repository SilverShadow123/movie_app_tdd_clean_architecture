
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_tdd_clean_architecture/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app_tdd_clean_architecture/data/datasources/remote/movie_remote_data_source_iml.dart';

import 'movie_remote_data_source.mocks.dart';


@GenerateMocks([http.Client])
 void main() {
 late MovieRemoteDataSource dataSource;
 late MockClient mockHttpClient;
  setUp(() {
    mockHttpClient = MockClient();
    dataSource = MovieRemoteDataSourceImpl(client: mockHttpClient);
  });

  test('should perform a GET request on a url to get trending movies', () async{
   when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response('Our api response', 200));

   await dataSource.getTrendingMovies();

    verify(mockHttpClient.get(
      Uri.parse('our api')));
  });
}