import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_flutter_sample/common/di/setup_locator.dart';
import 'package:movies_flutter_sample/common/observer/event_observer.dart';
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

  group('call tmdb api to fetch movies and handle states', () {
    test('on success', () async {
      final mockResponseData = {
        'results': [
          {'title': 'Movie 1'},
          {'title': 'Movie 2'},
        ],
      };
      when(mockRepo.loadMovies()).thenAnswer((_) async => mockResponseData);

      await viewModel.fetchMovies();

      verifyInOrder([
        eventObserver.notify(HomePageViewModel.onLoading, true),
        eventObserver.notify(HomePageViewModel.onLoading, false),
        eventObserver.notify(HomePageViewModel.onSuccess, null)
      ]);
      verify(mockRepo.loadMovies()).called(1);
    });

    test('on error', () async {
      when(mockRepo.loadMovies()).thenAnswer((_) async => Exception('Failed to load movies'));
      await viewModel.fetchMovies();

      verifyInOrder([
        eventObserver.notify(HomePageViewModel.onLoading, true),
        eventObserver.notify(HomePageViewModel.onLoading, false),
        eventObserver.notify(HomePageViewModel.onError, null)
      ]);

      verify(mockRepo.loadMovies()).called(1);
    });
  });
}
