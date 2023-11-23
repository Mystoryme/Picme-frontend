import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/checkpay.dart';
import 'package:picme/models/payment.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:picme/widget/payment_support/button_payment_support.dart';
import 'package:picme/widget/payment_support/detail_payment_support.dart';
import 'package:picme/widget/support/button_support.dart';
import 'package:picme/widget/support/textform_support.dart';

class PaymentSupportPage extends StatefulWidget {
  const PaymentSupportPage(
      {Key? key, required this.amount, this.postId, this.userId})
      : super(key: key);
  static const routeName = "/payment_support_page";
  final int? postId;
  final int? userId;
  final TextEditingController amount;

  @override
  State<PaymentSupportPage> createState() => _PaymentSupportPageState();
}

class _PaymentSupportPageState extends State<PaymentSupportPage> {
  final TextEditingController _support = TextEditingController();
  Payment? payment;
  CheckPay? checkPay;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    // String uri = "/post/post_get";
    if (widget.postId != null) {
      Caller.dio.post("/post/donate", data: {
        "postId": widget.postId,
        "donateAmount": int.parse(widget.amount.text),
      }).then((response) {
        setState(() {
          payment = Payment.fromJson(response.data["data"]);
        });
        // handle the response
      }).onError((DioException error, _) {
        Caller.handle(context, error);
      });
    } else if (widget.userId != null) {
      Caller.dio.post("/profile/donate", data: {
        "userId": widget.userId,
        "donateAmount": int.parse(widget.amount.text),
      }).then((response) {
        setState(() {
          payment = Payment.fromJson(response.data["data"]);
        });
        // handle the response
      }).onError((DioException error, _) {
        Caller.handle(context, error);
      });
    }
  }

  void callCheck() async {
    Caller.dio.post("/post/donate/inquiry", data: {
      "transactionId": payment!.transactionId,
    }).then((response) async {
      setState(() {
        checkPay = CheckPay.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      // * Apply default error handling
      Caller.handle(context, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (payment == null) {
      return const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      );
    }

    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Homepage()),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 150,
                    // ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Payment',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                DetailPaymentSupport(
                  rawQr: payment!.qrRawData,
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    'You payment methods are saved and stored securely',
                    style: GoogleFonts.poppins(
                      color: PicmeColors.grayBlack,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                ButtonPaymentSupport(
                  callCheck: callCheck,
                  check: checkPay!.paymentSuccess,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
