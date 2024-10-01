import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_flutter_sample/common/di/setup_locator.dart';
import 'package:movies_flutter_sample/common/observer/event_observer.dart';
import 'package:movies_flutter_sample/feat/imdb/data/e_home_page_state.dart';
import 'package:movies_flutter_sample/feat/imdb/repository/movies_api_repository.dart';
import 'package:movies_flutter_sample/feat/imdb/viewmodel/home_page_vm.dart';

import 'home_page_vm_test.mocks.dart';

@GenerateMocks([TmdbApiRepository, EventObserver])
void main() {
  late HomePageViewModel viewModel;
  late MockTmdbApiRepository mockRepo;
  late EventObserver eventObserver;

  setUp(() {
    mockRepo = MockTmdbApiRepository();
    eventObserver = MockEventObserver();

    viewModel = HomePageViewModel(repo: mockRepo);
    viewModel.subscribe(eventObserver);
  });

  tearDown(() {
    getIt.reset();
  });

  Map<String, dynamic> mockMovieJson = {
    "page": 1,
    "results": [
      {
        "adult": false,
        "backdrop_path": "/path/to/backdrop.jpg",
        "genre_ids": [28, 12],
        "id": 123,
        "original_language": "en",
        "original_title": "Mock Movie",
        "overview": "This is a mock movie description.",
        "popularity": 7.5,
        "poster_path": "/path/to/poster.jpg",
        "release_date": "2024-01-01",
        "title": "Mock Movie",
        "video": false,
        "vote_average": 8.0,
        "vote_count": 200,
      },
    ],
    "total_pages": 1,
    "total_results": 1,
  };

  group('call tmdb api to fetch movies and handle states', () {
    test('on success', () async {

      when(mockRepo.loadMovies()).thenAnswer((_) async => mockMovieJson);

      await viewModel.fetchMovies();

      verifyInOrder([
        eventObserver.notify(HomePageViewModel.onUpdateState, HomePageState.loading),
        eventObserver.notify(HomePageViewModel.onUpdateState, HomePageState.success),
      ]);
      verify(mockRepo.loadMovies()).called(1);
    });

    test('on error', () async {
      when(mockRepo.loadMovies()).thenAnswer((_) async => Exception('Failed to load movies'));
      await viewModel.fetchMovies();

      verifyInOrder([
        eventObserver.notify(HomePageViewModel.onUpdateState, HomePageState.loading),
        eventObserver.notify(HomePageViewModel.onUpdateState, HomePageState.error),
      ]);

      verify(mockRepo.loadMovies()).called(1);
    });
  });
}
