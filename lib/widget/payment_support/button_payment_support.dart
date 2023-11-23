import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/payment_success_page.dart';
import 'package:picme/utils/colors.dart';

import '../../classes/caller.dart';
import '../../models/checkpay.dart';

class ButtonPaymentSupport extends StatelessWidget {
  final String? transactionId;
  final String? transactionId2;
  final String? transactionId3;

  const ButtonPaymentSupport({
    Key? key,
    this.transactionId,
    this.transactionId2,
    this.transactionId3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Next');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: PicmeColors.mainColor,
            elevation: 0,
          ),
          onPressed: () {
            if (transactionId != null) {
              Caller.dio.post("/post/donate/inquiry", data: {
                "transactionId": transactionId,
              }).then((response) async {
                CheckPay checkPay = CheckPay.fromJson(response.data["data"]);
                if (checkPay.paymentSuccess == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentSuccessPage(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Payment not successful'),
                        content: const Text('Please try again'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              }).onError((DioException error, _) {
                Caller.handle(context, error);
              });
            } else if (transactionId2 != null) {
              Caller.dio.post("/profile/donate/inquiry", data: {
                "transactionId": transactionId2,
              }).then((response) async {
                CheckPay checkPay = CheckPay.fromJson(response.data["data"]);
                if (checkPay.paymentSuccess == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentSuccessPage(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Payment not successful'),
                        content: const Text('Please try again'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              }).onError((DioException error, _) {
                Caller.handle(context, error);
              });
            } else if (transactionId3 != null) {
              Caller.dio.post("/post/boost/inquiry", data: {
                "transactionId": transactionId3,
              }).then((response) async {
                CheckPay checkPay = CheckPay.fromJson(response.data["data"]);
                if (checkPay.paymentSuccess == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentSuccessPage(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Payment not successful'),
                        content: const Text('Please try again'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              }).onError((DioException error, _) {
                Caller.handle(context, error);
              });
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Next',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
