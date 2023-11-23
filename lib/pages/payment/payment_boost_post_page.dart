import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/pages/home/home.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:picme/widget/payment_boost_post/detail_payment_boost_post.dart';
import 'package:picme/widget/payment_support/button_payment_support.dart';

import '../../models/payment.dart';

class PaymentBoostPostPage extends StatefulWidget {
  const PaymentBoostPostPage(
      {Key? key,
      required this.postId,
      required this.amount,
      required this.total})
      : super(key: key);
  static const routeName = "/payment_boost_post_page";
  final int postId;
  final int amount;
  final int total;

  @override
  State<PaymentBoostPostPage> createState() => _PaymentBoostPostPageState();
}

class _PaymentBoostPostPageState extends State<PaymentBoostPostPage> {
  Payment? payment;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    // String uri = "/post/post_get";

    Caller.dio.post("/post/boost", data: {
      "postId": widget.postId,
      "boostDay": widget.amount,
      "amount": widget.total
    }).then((response) {
      setState(() {
        payment = Payment.fromJson(response.data["data"]);
      });
      // handle the response
    }).onError((DioException error, _) {
      showDialog(
          context: context,
          builder: (BuildContext context2) {
            return AlertDialog(
              title: const Text('Remind'),
              content: Text(error.response!.data["message"]),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Text('Ok'),
                ),
              ],
            );
          });
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
                DetailPaymentBoostPost(
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
                ButtonPaymentSupport(transactionId: payment!.transactionId),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
