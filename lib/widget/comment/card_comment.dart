import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/utils/colors.dart';

class CardComment extends StatelessWidget {
  const CardComment({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildNotificationRow(
            'ra_rabitty',
            'This image is so cute! I love it!',
            'assets/ra_rabitty.jpeg',
          ),
          const SizedBox(
            height: 20,
          ),
          buildNotificationRow(
            'yuri_iii',
            'how long did it take you to make this?',
            'assets/yuri_iii.jpeg',
          ),
          const SizedBox(
            height: 20,
          ),
          buildNotificationRow(
            'arisu.t',
            'It looks so good!',
            'assets/arisu.t.jpeg',
          ),
          const SizedBox(
            height: 20,
          ),
          buildNotificationRow(
            'esterbunny',
            'It not bad, but it could be better.',
            'assets/esterbunny.jpeg',
          ),
          const SizedBox(
            height: 20,
          ),
          buildNotificationRow(
            'pudding',
            'what program did you use to make this?',
            'assets/pudding.jpeg',
          ),
        ],
      ),
    );
  }

  Row buildNotificationRow(String username, String action, String avatarImage) {
    return Row(
      children: [
        CircleAvatar(
          radius: 35.0,
          backgroundImage: AssetImage(avatarImage),
        ),
        const SizedBox(width: 15.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                maxLines: 2, // Set max lines to allow wrapping
                softWrap: true, // Enable text wrapping
                text: TextSpan(
                  text: username + ' : ',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: ' $action',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10), // Add some spacing
              Text(
                'Reply',
                style: GoogleFonts.poppins(
                  color: PicmeColors.grayBlack, // You can set the desired color
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
