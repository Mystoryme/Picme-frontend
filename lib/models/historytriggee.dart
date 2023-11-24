import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/profile.dart';

part 'historytriggee.g.dart';

@JsonSerializable()
class HistoryTriggee {

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;

  HistoryTriggee({
    required this.id,
    required this.username,
    required this.avatarUrl,
  });

  factory HistoryTriggee.fromJson(Map<String, dynamic> json) =>
      _$HistoryTriggeeFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryTriggeeToJson(this);
}
