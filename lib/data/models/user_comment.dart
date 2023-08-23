//{
//     "postId": 1,
//     "id": 1,
//     "name": "id labore ex et quam laborum",
//     "email": "Eliseo@gardner.biz",
//     "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
//   },

import 'package:json_annotation/json_annotation.dart';

part 'user_comment.g.dart';

@JsonSerializable()
class UserComment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  UserComment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  String get firstLetter => name.isEmpty ? '' : name[0].toUpperCase();

  factory UserComment.fromJson(Map<String, dynamic> json) =>
      _$UserCommentFromJson(json);

  Map<String, dynamic> toJson() => _$UserCommentToJson(this);
}
