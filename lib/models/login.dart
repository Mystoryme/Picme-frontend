import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  Login({
    required this.email,
    required this.password,
  });
  factory Login.fromJson(Map<String, dynamic> json) =>
      _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
