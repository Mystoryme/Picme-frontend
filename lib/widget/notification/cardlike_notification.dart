import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/notifications.dart';
import 'package:picme/pages/account_profile_page.dart';
import 'package:picme/pages/grid_click_page.dart';

class CardNotification extends StatefulWidget {
  const CardNotification({super.key});

  @override
  State<CardNotification> createState() => _CardNotificationState();
}

class _CardNotificationState extends State<CardNotification> {
  Notifications? notifications;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    Caller.dio.get("/notification/list").then((response) {
      setState(() {
        print(response.data["data"]);
        notifications = Notifications.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    const notificationTypes = {
      "comment": "commented your post",
      "like": "liked your post",
      "post_donate": "donated your post",
      "user_donate": "donated to you"
    };
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (notifications?.notifications?.map((e) => [
                      buildNotificationRow(
                          e.trigger!.username!,
                          notificationTypes[e.type] ?? " notified you.",
                          e.trigger!.avatarUrl!,
                          e.type!,
                          e.postId,
                          e.triggerId!),
                      const SizedBox(
                        height: 20,
                      ),
                    ]) ??
                [])
            .expand((element) => element)
            .toList(),
      ),
    );
  }

  Widget buildNotificationRow(String username, String action,
      String avatarImage, String type, int? postId, int userId) {
    return InkWell(
      onTap: () {
        if (type == "comment" || type == "like" || type == "post_donate") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GridClickPage(
                      postId: postId!,
                      onDelete: () {},
                    )),
          );
        } else if (type == "user_donate") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AccountProfilePage(
                      userId: userId,
                    )),
          );
        }
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 35.0,
            backgroundImage: Image.network(avatarImage).image,
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
      ),
    );
  }
}
