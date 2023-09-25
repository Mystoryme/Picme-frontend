import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailProfile extends StatelessWidget {
  const DetailProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 25,
          ),
          // alignment: Alignment.center,
          child: Text(
            'Username',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
