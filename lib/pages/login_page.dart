import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/utils/colors.dart';
import 'package:picme/widgets/login/button_login.dart';
import 'package:picme/widgets/login/textform_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 150,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome to Picme💖',
                    style: GoogleFonts.poppins(
                      color: PicmeColors.mainColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormLogin(email: _email, password: _password),
                const SizedBox(
                  height: 25,
                ),
                ButtonLogin(),
                Container(
                  height: 100,
                  // color: Colors.white,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have account?',
                        style: GoogleFonts.poppins(
                          color: PicmeColors.grayBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: PicmeColors.mainColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
