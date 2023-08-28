import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_practice/presentation/cubits/movie_cubit/movie_cubit.dart';
import 'package:test_practice/presentation/cubits/movie_filter_cubit/movie_filter_cubit.dart';

import '../../../di/get_it.dart';

@RoutePage()
class MovieScreen extends StatefulWidget implements AutoRouteWrapper {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<MovieCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<MovieFilterCubit>(),
        ),
      ],
      child: this,
    );
  }
}

class _MovieScreenState extends State<MovieScreen> {
  Timer? _debounce;


  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieFilterCubit, MovieFilterState>(
      listener: (context, state) {
        context.read<MovieCubit>().getMovies(params: state.params);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
        ),
        body: Column(
          children: [
            TextFormField(
              onChanged: _onSearchChanged,
            ),
            Expanded(
              child: BlocBuilder<MovieCubit, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is MovieLoaded) {
                    final movies = state.movieResults.results;
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
                                      decoration: BoxDecoration(
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
                  if (state is MovieError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<MovieFilterCubit>().searchMovies(query);
    });
  }
}
