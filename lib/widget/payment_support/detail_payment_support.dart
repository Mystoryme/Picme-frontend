import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/utils/colors.dart';

class DetailPaymentSupport extends StatelessWidget {
  const DetailPaymentSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [Image.asset('assets/promptpay.png')],
          ),
        ),
        Text(
          'Scan the QR code to pay',
          style: GoogleFonts.poppins(
            color: PicmeColors.grayBlack,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [Image.asset('assets/qrcode.png')],
          ),
        ),
      ],
    );
  }
}
