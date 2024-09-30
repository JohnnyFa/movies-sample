import 'package:movies_flutter_sample/common/observer/event_notify.dart';

import '../repository/movies_api_repository.dart';

class HomePageViewModel extends EventNotify {
  HomePageViewModel({required this.repo});

  final TmdbApiRepository repo;

  static const String onLoading = 'onLoading';
  static const String onSuccess = 'onSuccess';
  static const String onError = 'onSuccess';

  Future<void> fetchMovies() async {
    notify(onLoading, true);

    try {
      final result = await repo.loadMovies();
      notifyAll({onLoading: false, onSuccess: null});
    } catch (e) {
      notifyAll({onLoading: false, onError: null});
    }
  }
}
