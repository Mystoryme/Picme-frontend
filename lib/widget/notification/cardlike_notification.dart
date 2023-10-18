import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardlikeNotification extends StatelessWidget {
  const CardlikeNotification({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildNotificationRow(
            'ra_rabitty',
            'commented your post',
            'assets/ra_rabitty.jpeg',
          ),
          const SizedBox(
            height: 20,
          ),
          buildNotificationRow(
            'yuri_iii',
            'liked your post',
            'assets/yuri_iii.jpeg',
          ),
          const SizedBox(
            height: 20,
          ),
          buildNotificationRow(
            'arisu.t',
            'liked your post',
            'assets/arisu.t.jpeg',
          ),
          const SizedBox(
            height: 20,
          ),
          buildNotificationRow(
            'esterbunny',
            'commented your post',
            'assets/esterbunny.jpeg',
          ),
          const SizedBox(
            height: 20,
          ),
          buildNotificationRow(
            'pudding',
            'liked your post',
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
          child: RichText(
            maxLines: 2, // Set max lines to allow wrapping
            softWrap: true, // Enable text wrapping
            text: TextSpan(
              text: username,
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
        ),
      ],
    );
  }
}
