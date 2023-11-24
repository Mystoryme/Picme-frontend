import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/history.dart';
part 'histories.g.dart';

@JsonSerializable()
class Histories {
  @JsonKey(name: 'history')
  final List<History> history;

  Histories({
    required this.history,
  });
  factory Histories.fromJson(Map<String, dynamic> json) => _$HistoriesFromJson(json);

  get avatarUrl => null;

  Map<String, dynamic> toJson() => _$HistoriesToJson(this);
}
