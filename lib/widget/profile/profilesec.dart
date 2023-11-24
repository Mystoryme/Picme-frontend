import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/models/profile.dart';
import 'package:picme/pages/account_insights_page.dart';
import 'package:picme/pages/edit_profile_page.dart';
import 'package:picme/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:picme/utils/colors.dart';

class ProfileSection extends StatefulWidget {
  ProfileSection(
      {Key? key,
      required this.init,
      required this.profile,
      required this.reloadProfile})
      : super(key: key);

  final Function init;
  final Profile profile;
  final VoidCallback reloadProfile;

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  late SharedPreferences prefs;
  logout() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    }
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel',
                  style: GoogleFonts.poppins(color: PicmeColors.grayBlack)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout',
                  style: GoogleFonts.poppins(color: PicmeColors.mainColor)),
              onPressed: logout,
              // onPressed: () {
              //   // Perform the logout action here.
              //   // For example, you can navigate to the login page.
              //   Navigator.of(context).pop(); // Close the dialog
              //   Navigator.of(context).pushReplacement(MaterialPageRoute(
              //     builder: (context) =>
              //         LoginPage(), // Navigate to the login page
              //   ));
              // },
            ),
          ],
        );
      },
    );
  }

  // logout() async {
  @override
  Widget build(BuildContext context) {
    Image img = Image.network(
      widget.profile.avatarUrl ?? "https://cdn.crispedge.com/5d76cb.png",
      key: ValueKey(new Random().nextInt(100)),
    );
    return Container(
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
                widget.profile.username,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              IconButton(
                onPressed: () {
                  _showLogoutDialog(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => EditProfilePage()),
                  // );
                },
                icon: const Icon(
                  Icons.exit_to_app_rounded,
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
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: img.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage(
                                  reloadProfile: widget.reloadProfile)),
                        ).then((value) {
                          widget.init();
                        });
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
                            BoxConstraints(minHeight: 36, maxWidth: 180),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          // softWrap: true,
                          widget.profile.bio ?? " ",
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
                            BoxConstraints(minHeight: 36, maxWidth: 180),
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          // softWrap: true,
                          widget.profile.contact ?? "",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            backgroundColor: PicmeColors.mainColor),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AccountInsightsPage()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 26,
                          width: 120,
                          decoration: BoxDecoration(
                            // color: PicmeColors.mainColor,
                            borderRadius: BorderRadius.circular(7),
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
    );
  }
}
