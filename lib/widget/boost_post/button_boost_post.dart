import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/boost_post/boost_post_page.dart';
import 'package:picme/pages/boost_post/review_boost_post_page.dart';
import 'package:picme/utils/colors.dart';

class ButtonBoostPost extends StatelessWidget {
  const ButtonBoostPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          print('Next');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: PicmeColors.mainColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReviewBoostPostPage()),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                // color: PicmeColors.mainColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Next',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
