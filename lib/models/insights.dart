import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/insight.dart';
part 'insights.g.dart';

@JsonSerializable()
class Insights {
  @JsonKey(name: 'insight')
  final List<Insight> insights;

  Insights({
    required this.insights,
  });
  factory Insights.fromJson(Map<String, dynamic> json) =>
      _$InsightsFromJson(json);

  Map<String, dynamic> toJson() => _$InsightsToJson(this);
}
