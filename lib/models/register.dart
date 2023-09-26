import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()
class Register {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'confirmPassword')
  final String confirmPassword;

  Register({
    required this.email,
    required this.username,
    required this.password,
    required this.confirmPassword,
  });
  factory Register.fromJson(Map<String, dynamic> json) =>
      _$RegisterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}
