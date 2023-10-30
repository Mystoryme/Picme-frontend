import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gridpost.g.dart';

@JsonSerializable()
class GridPost {
  @JsonKey(name: 'postId')
  final int postId;

  @JsonKey(name: 'imageUrl')
  final String imageUrl;

  @JsonKey(name: 'likeCount')
  final int likeCount;

  @JsonKey(name: 'isLiked')
  final bool isLiked;

  @JsonKey(name: 'isBooked')
  final bool isBooked;
  // @JsonKey(name: 'category')
  // final String category;

  GridPost(
      {required this.postId,
      required this.imageUrl,
      required this.likeCount,
      required this.isLiked,
      required this.isBooked

      // required this.category,
      });

  factory GridPost.fromJson(Map<String, dynamic> json) =>
      _$GridPostFromJson(json);

  Map<String, dynamic> toJson() => _$GridPostToJson(this);
}
