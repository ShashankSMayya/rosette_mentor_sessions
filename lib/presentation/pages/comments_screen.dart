import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_practice/core/api/api_client.dart';
import 'package:test_practice/di/get_it.dart';
import 'package:test_practice/presentation/cubits/comments_cubit/comments_cubit.dart';

@RoutePage()
class CommentsScreen extends StatelessWidget implements AutoRouteWrapper {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('asdffffd'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CommentsCubit, CommentsState>(
              builder: (context, state) {
                if (state is CommentsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CommentsLoaded) {
                  return ListView.builder(
                    itemCount: state.comments.length,
                    itemBuilder: (context, index) {
                      final comment = state.comments[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            comment.firstLetter,
                          ),
                        ),
                        title: Text(comment.name),
                        subtitle: Text(comment.email),
                      );
                    },
                  );
                }
                if (state is CommentsError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return const Center(
                  child: Text('Comments Screen'),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CommentsCubit>().fetchComments();
            },
            child: const Text('Fetch Comments'),
          ),
        ],
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CommentsCubit>(),
      child: this,
    );
  }
}
