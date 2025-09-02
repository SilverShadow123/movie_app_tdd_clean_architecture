
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_tdd_clean_architecture/core/server_exception.dart';
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
String BASE_URL = 'https://api.themoviedb.org/3';
 String API_KEY = '9af13e5a234ae671bb76cbe828c0f2ed';

 final tUrl = '$BASE_URL/trending/movie/day?api_key=$API_KEY';
 const String sampleApiResponse = '''
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/path.jpg",
      "id": 1,
      "title": "Sample Movie",
      "original_language": "en",
      "original_title": "Sample Movie",
      "overview": "Overview here",
      "poster_path": "/path2.jpg",
      "media_type": "movie",
      "genre_ids": [1, 2, 3],
      "popularity": 100.0,
      "release_date": "2020-01-01",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 100
    }
  ],
  "total_pages": 1,
  "total_results": 1
}
''';

  test('should perform a GET request on a url to get trending movies', () async{
   when(mockHttpClient.get(Uri.parse(tUrl))).thenAnswer((_) async => http.Response(sampleApiResponse, 200));

   await dataSource.getTrendingMovies();

    verify(mockHttpClient.get(
      Uri.parse(tUrl)));
  });

  test('should throw a ServerException when the response code is 404', () async{
   when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response('Our api response', 404));

   final call = dataSource.getTrendingMovies;

expect(() => call(), throwsA(isA<ServerException>()));
  }

  );
}