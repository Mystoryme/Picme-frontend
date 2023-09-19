import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/login_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Get.to(const LoginPage());
    });
    return Scaffold(
      backgroundColor: PicmeColors.mainColor,
      body: Center(
        child: Text(
          'Picme',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
