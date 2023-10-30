// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gridposts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridPosts _$GridPostsFromJson(Map<String, dynamic> json) => GridPosts(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => GridPost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GridPostsToJson(GridPosts instance) => <String, dynamic>{
      'posts': instance.posts,
    };
