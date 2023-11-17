import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/profile.dart';

part 'notificationpost.g.dart';

@JsonSerializable()
class NotificationPost {

  @JsonKey(name: 'id')
  final int? id;

  NotificationPost({
    required this.id,
  });

  factory NotificationPost.fromJson(Map<String, dynamic> json) =>
      _$NotificationPostFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationPostToJson(this);
}
