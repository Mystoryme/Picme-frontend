// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentPosts _$CommentPostsFromJson(Map<String, dynamic> json) => CommentPosts(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => CommentPost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentPostsToJson(CommentPosts instance) =>
    <String, dynamic>{
      'posts': instance.posts,
    };
