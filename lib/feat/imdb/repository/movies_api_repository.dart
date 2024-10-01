import '../../../common/adapter/dio_get_client.dart';

class TmdbApiRepository {
  TmdbApiRepository({required this.getClient});

  final DioGetClient getClient;

  Future<dynamic> loadMovies({int page = 1}) async {
    final json = await getClient.get(
      url: '/movie/popular',
      queryParameters: {
        'language': 'pt-BR',
        'page': page,
      },
    );
    return json;
  }
}
