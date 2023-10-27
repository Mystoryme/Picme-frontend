import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/posts.dart';

part 'homepost.g.dart';

@JsonSerializable()
class HomePost {
  @JsonKey(name: 'posts')
  final List<Post> posts;


  HomePost({
    required this.posts,
  });
  factory HomePost.fromJson(Map<String, dynamic> json) => _$HomePostFromJson(json);

  Map<String, dynamic> toJson() => _$HomePostToJson(this);
}
