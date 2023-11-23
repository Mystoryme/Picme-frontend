import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/payment_success_page.dart';
import 'package:picme/utils/colors.dart';

import '../../classes/caller.dart';
import '../../models/checkpay.dart';

class ButtonPaymentSupport extends StatelessWidget {
 final String transactionId;
  const ButtonPaymentSupport(
      {Key? key, required this.transactionId})
      : super(key: key);



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
              backgroundColor: PicmeColors.mainColor, elevation: 0),
          onPressed: () {
            Caller.dio.post("/post/donate/inquiry", data: {
              "transactionId": transactionId,
            }).then((response) async {

               CheckPay checkPay = CheckPay.fromJson(response.data["data"]);
               if (checkPay.paymentSuccess == true) {
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (context) => const PaymentSuccessPage()),
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
                 // const AlertDialog(
                 //   title: Text('Payment not successful'),
                 // );
               }

            }).onError((DioException error, _) {
              // * Apply default error handling
              Caller.handle(context, error);
            });

          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
              // color: PicmeColors.mainColor,
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