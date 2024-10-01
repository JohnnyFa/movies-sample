import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String moviePath;

  const MoviePoster({super.key, required this.moviePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.black12,
      child: moviePath.isNotEmpty
          ? Image.network(
              moviePath,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes as num)
                        : null,
                  ),
                );
              },
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.broken_image,
                    size: 50.0,
                    color: Colors.grey,
                  ),
                );
              },
            )
          : const Center(
              child: Icon(
                Icons.image_not_supported,
                size: 50.0,
                color: Colors.grey,
              ),
            ),
    );
  }
}
