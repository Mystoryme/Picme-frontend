import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/payment/payment_support_page.dart';
import 'package:picme/pages/support/review_support_page.dart';
import 'package:picme/utils/colors.dart';

class ButtonReviewSupport extends StatelessWidget {
  const ButtonReviewSupport({Key? key, this.postId, required this.amount, this.userId}) : super(key: key);
  final int? postId;
  final int? userId;
  final TextEditingController amount;

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
                    builder: (context) => PaymentSupportPage(postId: postId,amount: amount,userId: userId,)),
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
