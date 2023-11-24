import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/profile.dart';

part 'historytrigger.g.dart';

@JsonSerializable()
class HistoryTrigger {

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;

  HistoryTrigger({
    required this.id,
    required this.username,
    required this.avatarUrl,
  });

  factory HistoryTrigger.fromJson(Map<String, dynamic> json) =>
      _$HistoryTriggerFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryTriggerToJson(this);
}
