// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) => Register(
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
