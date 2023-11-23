import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/payment_success_page.dart';
import 'package:picme/utils/colors.dart';

class ButtonPaymentSupport extends StatelessWidget {
  final Function callCheck;
  final bool check;
  const ButtonPaymentSupport(
      {Key? key, required this.callCheck, required this.check})
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
            callCheck();
            if (check == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaymentSuccessPage()),
              );
            } else {
              AlertDialog(
                title: Text('Payment not successful'),
              );
            }
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
