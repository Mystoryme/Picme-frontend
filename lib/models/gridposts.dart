import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/gridpost.dart';
import 'package:picme/models/post.dart';

part 'gridposts.g.dart';

@JsonSerializable()
class GridPosts {
  @JsonKey(name: 'posts')
  final List<GridPost> posts;

  GridPosts({
    required this.posts,
  });
  factory GridPosts.fromJson(Map<String, dynamic> json) =>
      _$GridPostsFromJson(json);

  Map<String, dynamic> toJson() => _$GridPostsToJson(this);
}
