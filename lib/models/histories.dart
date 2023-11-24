import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/history.dart';
part 'histories.g.dart';

@JsonSerializable()
class Histories {
  @JsonKey(name: 'histories')
  final List<History> histories;

  Histories({
    required this.histories,
  });
  factory Histories.fromJson(Map<String, dynamic> json) => _$HistoriesFromJson(json);

  get avatarUrl => null;

  Map<String, dynamic> toJson() => _$HistoriesToJson(this);
}
