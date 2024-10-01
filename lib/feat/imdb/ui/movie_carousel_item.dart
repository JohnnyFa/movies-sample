import 'package:flutter/material.dart';
import 'package:movies_flutter_sample/common/constants/app_constants.dart';
import 'package:movies_flutter_sample/feat/imdb/data/movie.dart';
import 'package:movies_flutter_sample/feat/imdb/ui/movie_poster.dart';

class MovieCarouselItem extends StatelessWidget {
  final Results movie;

  const MovieCarouselItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.title ?? 'No Title',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            MoviePoster(
              moviePath: _fullPath,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Data de lancamento: ${movie.releaseDate ?? 'N/A'}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Nota: ${movie.voteAverage}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _fullPath => '${AppConstants.imagesUrl}${AppConstants.posterSize}${movie.posterPath}';
}
