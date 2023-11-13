import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class CommentPost {
  @JsonKey(name: 'userId')
  final int userId;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'postId')
  final int postId;

  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;

  @JsonKey(name: 'message')
  final String message;
  // @JsonKey(name: 'category')
  // final String category;

  CommentPost(
      {required this.username,
      required this.userId,
      required this.postId,
      required this.avatarUrl,
      required this.message

      // required this.category,
      });

  factory CommentPost.fromJson(Map<String, dynamic> json) =>
      _$CommentPostFromJson(json);

  Map<String, dynamic> toJson() => _$CommentPostToJson(this);
}
