// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'histories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Histories _$HistoriesFromJson(Map<String, dynamic> json) => Histories(
      history: (json['history'] as List<dynamic>)
          .map((e) => History.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoriesToJson(Histories instance) => <String, dynamic>{
      'history': instance.history,
    };
