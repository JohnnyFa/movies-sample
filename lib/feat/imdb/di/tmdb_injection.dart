import 'package:movies_flutter_sample/feat/imdb/viewmodel/home_page_vm.dart';

import '../../../common/adapter/dio_get_client.dart';
import '../../../common/di/setup_locator.dart';
import '../repository/movies_api_repository.dart';

void tmdbInjection() {
  getIt..registerFactory<TmdbApiRepository>(
        () => TmdbApiRepository(getClient: getIt<DioGetClient>()),
  )
    ..registerLazySingleton(() => HomePageViewModel(repo: getIt()));
}