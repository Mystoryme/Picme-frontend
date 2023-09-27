import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/edit_profile_page.dart';
import 'package:picme/pages/login_page.dart';

import 'package:picme/utils/colors.dart';
import 'package:picme/widget/profile/detail_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 15.0, right: 34, left: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 150,
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // alignment: Alignment.center,
                  Text(
                    'Username',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage()),
                      );
                    },
                    icon: Icon(
                      CupertinoIcons.chat_bubble,
                      size: 33,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 60.0,
                          backgroundImage: AssetImage("assets/profile.jpg"),
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
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w400,
                                color: PicmeColors.grayBlack),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bio',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: PicmeColors.grayBlack),
                          ),
                          Container(
                            constraints:
                                BoxConstraints(minHeight: 36, maxWidth: 190),
                            child: Text(
                              'illustrator || Story artist || cat lover',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Contact',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: PicmeColors.grayBlack),
                          ),
                          Container(
                            constraints:
                                BoxConstraints(minHeight: 36, maxWidth: 190),
                            child: Text(
                              'Contact 081-xxx-xxxx , Twitter: @abcd',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: PicmeColors.mainColor),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 23,
                              width: 120,
                              decoration: BoxDecoration(
                                // color: PicmeColors.mainColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Account Insights',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
