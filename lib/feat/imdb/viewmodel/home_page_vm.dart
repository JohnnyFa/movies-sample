import 'package:movies_flutter_sample/common/observer/event_notify.dart';

import '../data/e_home_page_state.dart';
import '../data/movie.dart';
import '../repository/movies_api_repository.dart';

class HomePageViewModel extends EventNotify {
  HomePageViewModel({required this.repo});

  final TmdbApiRepository repo;

  static const String onUpdateState = 'onUpdateState';

  Movie? movies;

  Future<void> fetchMovies() async {
    notify(onUpdateState, HomePageState.loading);

    try {
      final result = await repo.loadMovies();
      movies = Movie.fromJson(result);
      notify(onUpdateState, HomePageState.success);
    } catch (e) {
      notify(onUpdateState, HomePageState.error);
    }
  }
}
