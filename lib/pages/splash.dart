import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/login.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/pages/login_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  Future navigate() async {
    // Get user token from shared preferences
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? "";

    if (token == "") {
      return const LoginPage();
    }

    // Set caller token value
    Caller.setToken(token);
    return const Homepage();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () async {
      Widget target = await navigate();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => target),
      );
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
