import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insight.g.dart';

@JsonSerializable()
class Insight {
  @JsonKey(name: 'views')
  final int views;

  @JsonKey(name: 'likes')
  final int likes;

  Insight(
      {required this.views,
      required this.likes,
      });

  factory Insight.fromJson(Map<String, dynamic> json) =>
      _$InsightFromJson(json);

  Map<String, dynamic> toJson() => _$InsightToJson(this);
}
