import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/historytriggee.dart';
import 'package:picme/models/historytrigger.dart';

part 'history.g.dart';

@JsonSerializable()
class History {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'triggerId')
  final int? triggerId;

  @JsonKey(name: 'trigger')
  final HistoryTrigger? trigger;

  @JsonKey(name: 'triggeeId')
  final int? triggeeId;

  @JsonKey(name: 'triggee')
  final HistoryTriggee? triggee;

  @JsonKey(name: 'type')
  final String? type;

  History(
      {required this.id,
      required this.triggeeId,
      required this.triggerId,
      required this.type,
      required this.triggee,
      required this.trigger});

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}
