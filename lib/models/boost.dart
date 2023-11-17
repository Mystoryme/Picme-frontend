import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'boost.g.dart';

@JsonSerializable()
class Boost {
  @JsonKey(name: 'postId')
  final int postId;

  @JsonKey(name: 'imageUrl')
  final String imageUrl;
  // @JsonKey(name: 'category')
  // final String category;

  Boost(
      {required this.postId,
      required this.imageUrl,

      // required this.category,
      });

  factory Boost.fromJson(Map<String, dynamic> json) => _$BoostFromJson(json);

  Map<String, dynamic> toJson() => _$BoostToJson(this);
}
