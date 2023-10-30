// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gridpost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridPost _$GridPostFromJson(Map<String, dynamic> json) => GridPost(
      postId: json['postId'] as int,
      imageUrl: json['imageUrl'] as String,
      likeCount: json['likeCount'] as int,
      isLiked: json['isLiked'] as bool,
      isBooked: json['isBooked'] as bool,
    );

Map<String, dynamic> _$GridPostToJson(GridPost instance) => <String, dynamic>{
      'postId': instance.postId,
      'imageUrl': instance.imageUrl,
      'likeCount': instance.likeCount,
      'isLiked': instance.isLiked,
      'isBooked': instance.isBooked,
    };
