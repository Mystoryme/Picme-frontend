import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable()
class Search {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'bio')
  final String? bio;

  @JsonKey(name: 'contact')
  final String? contact;

  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;

  Search({required this.id,
          required this.username,
          required this.bio, 
          required this.contact,
          required this.avatarUrl
      
      });

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}
