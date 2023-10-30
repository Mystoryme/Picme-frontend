import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bookpost.g.dart';

@JsonSerializable()
class BookPost {
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

  BookPost(
      {required this.postId,
      required this.imageUrl,
      required this.likeCount,
      required this.isLiked,
      required this.isBooked

      // required this.category,
      });

  factory BookPost.fromJson(Map<String, dynamic> json) =>
      _$BookPostFromJson(json);

  Map<String, dynamic> toJson() => _$BookPostToJson(this);
}
