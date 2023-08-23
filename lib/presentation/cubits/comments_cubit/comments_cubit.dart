import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/api/api_client.dart';
import '../../../data/models/user_comment.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final ApiClient _apiClient;

  CommentsCubit(this._apiClient) : super(CommentsInitial());

  Future<void> fetchComments() async {
    emit(CommentsLoading());
    try {
      final res = await _apiClient.get("/posts/1/comments");
      final List<UserComment> comments = List<UserComment>.from(
          res.map((comment) => UserComment.fromJson(comment)));
      emit(CommentsLoaded(comments));
    } catch (e) {
      emit(
        CommentsError(e.toString()),
      );
    }
  }
}
