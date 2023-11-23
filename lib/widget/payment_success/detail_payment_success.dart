import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/utils/colors.dart';

class DetailPaymentSuccess extends StatelessWidget {
  const DetailPaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [Image.asset('assets/success.png')],
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          'Thank you. Your payment has been successfully processed',
          style: GoogleFonts.poppins(
            color: PicmeColors.grayBlack,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
