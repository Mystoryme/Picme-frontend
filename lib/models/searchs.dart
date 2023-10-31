import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/search.dart';

part 'searchs.g.dart';

@JsonSerializable()
class Searchs {
  @JsonKey(name: 'posts')
  final List<Search> posts;

  Searchs({
    required this.posts,
  });
  factory Searchs.fromJson(Map<String, dynamic> json) =>
      _$SearchsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchsToJson(this);
}
