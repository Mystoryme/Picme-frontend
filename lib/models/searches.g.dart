// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Searches _$SearchesFromJson(Map<String, dynamic> json) => Searches(
      users: (json['users'] as List<dynamic>)
          .map((e) => Search.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchesToJson(Searches instance) => <String, dynamic>{
      'users': instance.users,
    };
