// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search _$SearchFromJson(Map<String, dynamic> json) => Search(
      id: json['id'] as int,
      username: json['username'] as String,
      bio: json['bio'] as String?,
      contact: json['contact'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'bio': instance.bio,
      'contact': instance.contact,
      'avatarUrl': instance.avatarUrl,
    };
