import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: 'postId')
  final int postId;

  @JsonKey(name: 'ownerId')
  final int ownerId;

  @JsonKey(name: 'ownerUsername')
  final String ownerUsername;

  @JsonKey(name: 'caption')
  final String caption;

  @JsonKey(name: 'imageUrl')
  final String imageUrl;

  @JsonKey(name: 'likeCount')
  final int likeCount;

  @JsonKey(name: 'commentCount')
  final int commentCount;

  Post({
    required this.postId,
    required this.ownerId,
    required this.ownerUsername,
    required this.caption,
    required this.imageUrl,
    required this.likeCount,
    required this.commentCount,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
