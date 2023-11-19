import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadAccountPost extends StatelessWidget {
  const HeadAccountPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Back',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
