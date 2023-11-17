import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/profile.dart';

part 'notificationtrigger.g.dart';

@JsonSerializable()
class NotificationTrigger {

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;

  NotificationTrigger({
    required this.id,
    required this.username,
    required this.avatarUrl,
  });

  factory NotificationTrigger.fromJson(Map<String, dynamic> json) =>
      _$NotificationTriggerFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationTriggerToJson(this);
}
