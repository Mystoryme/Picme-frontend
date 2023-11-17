import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/boost.dart';

part 'boosts.g.dart';

@JsonSerializable()
class Boosts {
  @JsonKey(name: 'posts')
  final List<Boost> posts;

  Boosts({
    required this.posts,
  });
  factory Boosts.fromJson(Map<String, dynamic> json) =>
      _$BoostsFromJson(json);

  Map<String, dynamic> toJson() => _$BoostsToJson(this);
}
