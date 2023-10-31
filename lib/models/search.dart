import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable()
class Search {
  @JsonKey(name: 'userId')
  final int userId;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;

  Search({required this.userId, required this.username, required this.avatarUrl
      // required this.category,
      });

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}
