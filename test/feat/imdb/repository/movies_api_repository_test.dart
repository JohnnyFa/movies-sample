
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_flutter_sample/common/adapter/dio_get_client.dart';
import 'package:movies_flutter_sample/common/di/setup_locator.dart';
import 'package:movies_flutter_sample/feat/imdb/repository/movies_api_repository.dart';

import 'movies_api_repository_test.mocks.dart';

@GenerateMocks([DioGetClient])
void main() {
  late TmdbApiRepository repository;
  late MockDioGetClient mockGetClient;

  setUp(() {
    mockGetClient = MockDioGetClient();
    repository = TmdbApiRepository(getClient: mockGetClient);
  });

  tearDown(() {
    getIt.reset();
  });

  test('loadMovies returns data when the client call is successful', () async {
    // Arrange
    final mockResponseData = {
      'results': [
        {'title': 'Movie 1'},
        {'title': 'Movie 2'},
      ],
    };

    when(mockGetClient.get(
      url: '/movie/popular',
      queryParameters: anyNamed('queryParameters'),
    )).thenAnswer((_) async => mockResponseData);

    // Act
    final result = await repository.loadMovies();

    // Assert
    expect(result, equals(mockResponseData));
    verify(mockGetClient.get(
      url: '/movie/popular',
      queryParameters: anyNamed('queryParameters'),
    )).called(1);
  });

  test('loadMovies throws an exception when the client call fails', () async {
    // Arrange
    final exception = Exception('Network error');

    // Mock the get method to throw an exception
    when(mockGetClient.get(
      url: '/movie/popular',
      queryParameters: anyNamed('queryParameters'),
    )).thenThrow(exception);

    // Act & Assert
    expect(
          () async => await repository.loadMovies(),
      throwsA(isA<Exception>()),
    );

    verify(mockGetClient.get(
      url: '/movie/popular',
      queryParameters: anyNamed('queryParameters'),
    )).called(1);
  });
}