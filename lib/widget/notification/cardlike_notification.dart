import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/notifications.dart';

class CardlikeNotification extends StatefulWidget {
  const CardlikeNotification({super.key});

  @override
  State<CardlikeNotification> createState() => _CardlikeNotificationState();
}

class _CardlikeNotificationState extends State<CardlikeNotification> {
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
                          e.type!),
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

  Widget buildNotificationRow(
      String username, String action, String avatarImage, String type) {
    return InkWell(
      onTap: () {
        if (type == "comment" || type == "like" || type == "post_donate") {
          Navigator.pushNamed(context, "/postcard", arguments: {
            "id": username,
          });
        } else if (type == "user_donate") {
          Navigator.pushNamed(context, "/profile", arguments: {
            "id": username,
          });
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
