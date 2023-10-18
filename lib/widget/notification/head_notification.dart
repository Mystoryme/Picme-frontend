import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadNotification extends StatelessWidget {
  const HeadNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, left: 19),
          child: Text(
            'Notifications',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
