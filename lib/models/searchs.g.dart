// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Searchs _$SearchsFromJson(Map<String, dynamic> json) => Searchs(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => Search.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchsToJson(Searchs instance) => <String, dynamic>{
      'posts': instance.posts,
    };
