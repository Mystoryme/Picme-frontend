import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'bio')
  final String? bio;

  @JsonKey(name: 'contact')
  final String? contact;

  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;

  Profile({
    required this.id,
    required this.username,
    required this.bio,
    required this.contact,
    required this.avatarUrl,
  });
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
