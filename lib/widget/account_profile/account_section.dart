import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/models/profile.dart';
import 'package:picme/pages/account_insights_page.dart';
import 'package:picme/pages/edit_profile_page.dart';
import 'package:picme/pages/login_page.dart';
import 'package:picme/pages/support/support_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:picme/utils/colors.dart';

class AccountSection extends StatelessWidget {
  AccountSection({Key? key, required this.profile}) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 5.0, left: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black54,
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // alignment: Alignment.center,
                  Text(
                    profile.username,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 34, left: 34),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(profile.avatarUrl ??
                          "https://cdn.crispedge.com/5d76cb.png"),
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
                          profile.bio ?? " ",
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
                          profile.contact ?? "",
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
                                    const SupportPage()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 26,
                          width: 80,
                          decoration: BoxDecoration(
                            // color: PicmeColors.mainColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text(
                            'Support',
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
