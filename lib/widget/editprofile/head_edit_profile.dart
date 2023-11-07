import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/profile_page.dart';
import 'package:picme/utils/colors.dart';

class HeadEditProfile extends StatelessWidget {
  final Function callEdit;
  const HeadEditProfile({required this.callEdit, Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: double.infinity,
          // padding: const EdgeInsets.only(top: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(left: 15),
                  // alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Cancel'),
                        content: Text(
                          'Are you sure you want to cancel this your change?',
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(
                              context,
                              // MaterialPageRoute(
                              //     builder: (context) => const ProfilePage()),
                            ),
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.poppins(
                                  color: PicmeColors.grayBlack),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the AlertDialog
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const ProfilePage(),
                                ),
                              );
                            },
                            child: Text(
                              'Yes',
                              style: GoogleFonts.poppins(
                                  color: PicmeColors.mainColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: PicmeColors.grayBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Edit Profile',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(right: 15),
                  // alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      callEdit();
                    },
                    child: Text(
                      'Save',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: PicmeColors.mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
