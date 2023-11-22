import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/support/review_support_page.dart';
import 'package:picme/utils/colors.dart';

class ButtonSupport extends StatelessWidget {
  const ButtonSupport({Key? key, required this.supportController})
      : super(key: key);
  final TextEditingController supportController;
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
            if (supportController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please enter your tips'),
                ),
              );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReviewSupportPage(
                        amount: supportController,
                      )),
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
    );
  }
}
