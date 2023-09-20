import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/pages/profile_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:picme/widget/profile.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Login');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: PicmeColors.mainColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
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
              'Login',
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
