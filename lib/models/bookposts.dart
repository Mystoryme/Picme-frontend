import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/bookpost.dart';
import 'package:picme/models/gridpost.dart';
import 'package:picme/models/post.dart';

part 'bookposts.g.dart';

@JsonSerializable()
class BookPosts {
  @JsonKey(name: 'posts')
  final List<BookPost> posts;

  BookPosts({
    required this.posts,
  });
  factory BookPosts.fromJson(Map<String, dynamic> json) =>
      _$BookPostsFromJson(json);

  Map<String, dynamic> toJson() => _$BookPostsToJson(this);
}
