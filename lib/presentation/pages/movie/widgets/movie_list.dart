import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/movie.dart';

class MovieListWidget extends StatelessWidget {
  final List<Movie> movies;

  const MovieListWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return _MovieGridLayout(movies: movies);
        } else {
          return _MovieListLayout(movies: movies);
        }
      },
    );
  }
}

class _MovieGridLayout extends StatelessWidget {
  final List<Movie> movies;

  const _MovieGridLayout({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: size.width > 1200 ? 4 : 3),
      itemCount: movies.length,
      itemBuilder: (context, index) => Card(
        child: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${movies[index].posterPath}',
              ),
            ),
            Text(
              movies[index].title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieListLayout extends StatelessWidget {
  final List<Movie> movies;

  const _MovieListLayout({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              subtitle: Text(
                movie.overview ?? '-',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              leading: movie.posterPath != null
                  ? CachedNetworkImage(
                      height: 100,
                      width: 80,
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    )
                  : Container(
                      height: 100,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                    ),
              title: Text(
                movie.title,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ));
  }
}
