// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookpost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookPost _$BookPostFromJson(Map<String, dynamic> json) => BookPost(
      postId: json['postId'] as int,
      imageUrl: json['imageUrl'] as String,
      likeCount: json['likeCount'] as int,
      isLiked: json['isLiked'] as bool,
      isBooked: json['isBooked'] as bool,
    );

Map<String, dynamic> _$BookPostToJson(BookPost instance) => <String, dynamic>{
      'postId': instance.postId,
      'imageUrl': instance.imageUrl,
      'likeCount': instance.likeCount,
      'isLiked': instance.isLiked,
      'isBooked': instance.isBooked,
    };
