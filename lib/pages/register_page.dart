import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/register.dart';
import 'package:picme/pages/login_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:picme/widget/register/button_register.dart';
import 'package:picme/widget/register/textform_register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const routeName = "/register_page";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  void callRegister() async {
    Caller.dio.post("/account/register", data: {
      "username": _username.text, // * Change "email" to "username
      "password": _password.text,
      "email": _email.text,
      "confirmpassword": _confirmpassword.text,
    }).then((response) async {
      // * Parse response
      // final data = Register.fromJson(response.data["data"]);

      // // // * Load shared preferences
      // final prefs = await SharedPreferences
      //     .getInstance(); //shared_preferences same as cookies
      // prefs.setString('data', data.toString());

      //* Set caller token value
      // Caller.setToken(data.toString());

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
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
                // const SizedBox(
                //   height: 150,
                // ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Register',
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
                TextFormRegister(
                  email: _email,
                  username: _username,
                  password: _password,
                  confirmpassword: _confirmpassword,
                ),
                const SizedBox(
                  height: 25,
                ),
                ButtonRegister(callRegister: callRegister),
                Container(
                  height: 100,
                  // color: Colors.white,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: Text(
                          'Cancel',
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
