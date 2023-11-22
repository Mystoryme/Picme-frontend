// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      qrRawData: json['qrRawData'] as String,
      qrImage: json['qrImage'] as String,
      transactionId: json['transactionId'] as String,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'qrRawData': instance.qrRawData,
      'qrImage': instance.qrImage,
      'transactionId': instance.transactionId,
    };
