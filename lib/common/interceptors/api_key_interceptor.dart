import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

InterceptorsWrapper apiKeyInterceptor() {
  return InterceptorsWrapper(
    onRequest: (options, handler) {
      final apiKey = dotenv.env['TMDB_API_KEY'];
      if (apiKey == null || apiKey.isEmpty) {
        throw Exception('API key is not set. Please check your .env file.');
      }
      options.queryParameters['api_key'] = apiKey;
      return handler.next(options);
    },
  );
}