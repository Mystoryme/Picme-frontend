import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/login.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/pages/register_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:picme/widget/login/button_login.dart';
import 'package:picme/widget/login/textform_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = "/login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void callLogin() async {
    Caller.dio.post("/account/login", data: {
      "email": _email.text,
      "password": _password.text,
    }).then((response) async {
      // * Parse response
      final data = Login.fromJson(response.data["data"]);

      // * Load shared preferences
      final prefs = await SharedPreferences
          .getInstance(); //shared_preferences same as cookies
      prefs.setString('token', data.token);

      // * Set caller token value
      Caller.setToken(data.token);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    }).onError((DioException error, _) {
      // * Apply default error handling
      Caller.handle(context, error);
    });
  }

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
                ButtonLogin(callLogin: callLogin),
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
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
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
