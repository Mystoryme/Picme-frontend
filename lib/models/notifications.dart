import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/gridpost.dart';
import 'package:picme/models/notification.dart';
import 'package:picme/models/post.dart';

part 'notifications.g.dart';

@JsonSerializable()
class Notifications {
  @JsonKey(name: 'notifications')
  final List<Notification> notifications;

  Notifications({
    required this.notifications,
  });
  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsToJson(this);
}
