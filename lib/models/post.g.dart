// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      postId: json['postId'] as int,
      ownerId: json['ownerId'] as int,
      ownerUsername: json['ownerUsername'] as String,
      caption: json['caption'] as String,
      imageUrl: json['imageUrl'] as String,
      likeCount: json['likeCount'] as int,
      commentCount: json['commentCount'] as int,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'postId': instance.postId,
      'ownerId': instance.ownerId,
      'ownerUsername': instance.ownerUsername,
      'caption': instance.caption,
      'imageUrl': instance.imageUrl,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
    };
