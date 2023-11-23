import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:picme/widget/payment_boost_post/detail_payment_boost_post.dart';
import 'package:picme/widget/payment_support/button_payment_support.dart';

class PaymentBoostPostPage extends StatefulWidget {
  const PaymentBoostPostPage({Key? key}) : super(key: key);
  static const routeName = "/payment_boost_post_page";

  @override
  State<PaymentBoostPostPage> createState() => _PaymentBoostPostPageState();
}

class _PaymentBoostPostPageState extends State<PaymentBoostPostPage> {
  Widget build(BuildContext context) {
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
                DetailPaymentBoostPost(),
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
                //const ButtonPaymentSupport(),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
