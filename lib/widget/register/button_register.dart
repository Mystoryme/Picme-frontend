import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/login_page.dart';
import 'package:picme/utils/colors.dart';

class ButtonRegister extends StatelessWidget {
  final Function callRegister;
  const ButtonRegister({required this.callRegister, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Register');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: PicmeColors.mainColor, elevation: 0),
          onPressed: () {
            callRegister();
          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
              // color: PicmeColors.mainColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Register',
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
