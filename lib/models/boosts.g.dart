// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boosts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Boosts _$BoostsFromJson(Map<String, dynamic> json) => Boosts(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => Boost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BoostsToJson(Boosts instance) => <String, dynamic>{
      'posts': instance.posts,
    };
