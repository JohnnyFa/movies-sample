import 'package:flutter_dotenv/flutter_dotenv.dart';

class TMDBApiService {
  final String apiKey;

  TMDBApiService() : apiKey = dotenv.env['TMDB_API_KEY'] ?? '' {
    if (apiKey.isEmpty) {
      throw Exception('API key not found. Please set TMDB_API_KEY in your .env file.');
    }
  }
}