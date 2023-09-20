import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/edit_profile_page.dart';

import 'package:picme/utils/colors.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                // alignment: Alignment.center,
                child: Text(
                  'Username',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 15,
                          right: 15,
                        ),
                        child: const CircleAvatar(
                          radius: 60.0,
                          backgroundImage: AssetImage("assets/profile.jpg"),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage()),
                          );
                        },
                        child: Text(
                          'Edit Profile',
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w400,
                              color: PicmeColors.grayBlack),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
