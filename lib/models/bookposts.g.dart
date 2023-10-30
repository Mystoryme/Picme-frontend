// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookposts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookPosts _$BookPostsFromJson(Map<String, dynamic> json) => BookPosts(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => BookPost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookPostsToJson(BookPosts instance) => <String, dynamic>{
      'posts': instance.posts,
    };
