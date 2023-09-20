import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/profile_page.dart';
import 'package:picme/utils/colors.dart';

class HeadEditProfile extends StatelessWidget {
  const HeadEditProfile({super.key});

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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()),
                      );
                    },
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  // alignment: Alignment.center,
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
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(right: 15),
                  // alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: PicmeColors.mainColor),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: Text(
                              'OK',
                              style: TextStyle(color: PicmeColors.mainColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: Text(
                      'Save',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: PicmeColors.mainColor,
                        fontSize: 18,
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
