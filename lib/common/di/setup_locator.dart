import 'package:get_it/get_it.dart';
import '../../feat/imdb/di/tmdb_injection.dart';
import '../adapter/dio_get_client.dart';
import '../factory/http_client.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<DioGetClient>(
        () => makeHttpGetClient(),
  );
  tmdbInjection();
}