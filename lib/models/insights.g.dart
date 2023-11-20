// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insights.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Insights _$InsightsFromJson(Map<String, dynamic> json) => Insights(
      insights: (json['insight'] as List<dynamic>)
          .map((e) => Insight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InsightsToJson(Insights instance) => <String, dynamic>{
      'insight': instance.insights,
    };
