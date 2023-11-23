// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentPost _$CommentPostFromJson(Map<String, dynamic> json) => CommentPost(
      Id: json['Id'] as int,
      username: json['username'] as String,
      userId: json['userId'] as int,
      postId: json['postId'] as int,
      avatarUrl: json['avatarUrl'] as String?,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CommentPostToJson(CommentPost instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'userId': instance.userId,
      'username': instance.username,
      'postId': instance.postId,
      'avatarUrl': instance.avatarUrl,
      'message': instance.message,
    };
