import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkpay.g.dart';

@JsonSerializable()
class CheckPay {
  @JsonKey(name: 'paymentSuccess')
  final bool paymentSuccess;

  CheckPay({
    required this.paymentSuccess,
  });

  factory CheckPay.fromJson(Map<String, dynamic> json) =>
      _$CheckPayFromJson(json);

  Map<String, dynamic> toJson() => _$CheckPayToJson(this);
}
