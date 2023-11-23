import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/payment/payment_boost_post_page.dart';
import 'package:picme/pages/payment/payment_support_page.dart';
import 'package:picme/pages/support/review_support_page.dart';
import 'package:picme/utils/colors.dart';

class ButtonReviewBoostPost extends StatelessWidget {
  const ButtonReviewBoostPost({Key? key, required this.postId, required this.amount,required this.total}) : super(key: key);
  final int postId;
  final int amount;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          print('Next');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: PicmeColors.mainColor, elevation: 0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentBoostPostPage(postId: postId,amount: amount,total: total,)),
              );
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
      ),
    );
  }
}
