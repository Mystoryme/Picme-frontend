import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  @JsonKey(name: 'qrRawData')
  final String qrRawData;

  @JsonKey(name: 'qrImage')
  final String qrImage;

  @JsonKey(name: 'transactionId')
  final String transactionId;

  Payment(
      {required this.qrRawData,
      required this.qrImage,
      required this.transactionId,
      });

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
