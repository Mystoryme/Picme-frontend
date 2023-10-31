import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/bookpost.dart';
import 'package:picme/models/comment.dart';
import 'package:picme/models/gridpost.dart';
import 'package:picme/models/post.dart';

part 'comments.g.dart';

@JsonSerializable()
class CommentPosts {
  @JsonKey(name: 'posts')
  final List<CommentPost> posts;

  CommentPosts({
    required this.posts,
  });
  factory CommentPosts.fromJson(Map<String, dynamic> json) =>
      _$CommentPostsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentPostsToJson(this);
}
