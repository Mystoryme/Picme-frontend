import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/profile.dart';

part 'notificationtriggee.g.dart';

@JsonSerializable()
class NotificationTriggee {

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;

  NotificationTriggee({
    required this.id,
    required this.username,
    required this.avatarUrl,
  });

  factory NotificationTriggee.fromJson(Map<String, dynamic> json) =>
      _$NotificationTriggeeFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationTriggeeToJson(this);
}
