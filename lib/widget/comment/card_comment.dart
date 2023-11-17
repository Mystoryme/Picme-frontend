// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/models/comment.dart';
import 'package:picme/utils/colors.dart';

class CardComment extends StatelessWidget {
  const CardComment({Key? key, required this.comment}) : super(key: key);
  final CommentPost comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildNotificationRow(
            comment.username,
            comment.message,
            comment.avatarUrl ?? "https://cdn.crispedge.com/5d76cb.png",
          ),
          const SizedBox(
            height: 20,
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
          backgroundImage: NetworkImage(avatarImage),
        ),
        const SizedBox(width: 15.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RichText(
                    maxLines: 2, // Set max lines to allow wrapping
                    softWrap: true, // Enable text wrapping
                    text: TextSpan(
                      text: '$username : ',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: action,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
              // const SizedBox(height: 10), // Add some spacing
              // Text(
              //   'Reply',
              //   style: GoogleFonts.poppins(
              //     color: PicmeColors.grayBlack, // You can set the desired color
              //     fontSize: 12,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
