import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/search.dart';

part 'searches.g.dart';

@JsonSerializable()
class Searches {
  @JsonKey(name: 'users')
  final List<Search> users;

  Searches({
    required this.users,
  });
  factory Searches.fromJson(Map<String, dynamic> json) =>
      _$SearchesFromJson(json);

  Map<String, dynamic> toJson() => _$SearchesToJson(this);
}
