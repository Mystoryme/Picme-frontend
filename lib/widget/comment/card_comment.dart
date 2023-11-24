// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/comment.dart';
import 'package:picme/models/profile.dart';
import 'package:picme/utils/colors.dart';

class CardComment extends StatefulWidget {
  const CardComment({Key? key, required this.comment, required this.onDelete})
      : super(key: key);
  final CommentPost comment;
  final VoidCallback onDelete;

  @override
  State<CardComment> createState() => _CardCommentState();
}

class _CardCommentState extends State<CardComment> {
  Profile? profile;

  @override
  void initState() {
    super.initState();
    init();
  }

  void deleteComment(BuildContext context) async {
    Caller.dio.delete("/comment/delete", data: {"id": widget.comment.Id}).then(
        (response) async {
      widget.onDelete();
    }).onError((DioException error, _) => Caller.handle(context, error));
  }

  init() {
    Caller.dio.get("/profile/info").then((response) {
      setState(() {
        profile = Profile.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildNotificationRow(
            widget.comment.username,
            widget.comment.message,
            widget.comment.avatarUrl ?? "https://cdn.crispedge.com/5d76cb.png",
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    maxLines: 2,
                    softWrap: true,
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
                  if (profile?.id ==
                      widget.comment.userId) // Remove curly braces here
                    PopupMenuButton(
                      padding: const EdgeInsets.only(right: 3),
                      color: PicmeColors.mainColor,
                      elevation: 1,
                      tooltip: "",
                      icon: Icon(
                        CupertinoIcons.ellipsis_vertical,
                        color: PicmeColors.mainColor,
                      ),
                      offset: Offset(-15, 45),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(6.0),
                          bottomRight: Radius.circular(6.0),
                          topLeft: Radius.circular(6.0),
                          topRight: Radius.circular(6.0),
                        ),
                      ),
                      itemBuilder: (ctx) =>
                          [_buildPopupMenuItem(ctx, 'Delete', deleteComment)],
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  PopupMenuItem _buildPopupMenuItem(
    BuildContext context,
    String title,
    void Function(BuildContext) deleteComment,
  ) {
    return PopupMenuItem(
      height: 20,
      onTap: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            titleTextStyle:
                GoogleFonts.poppins(fontSize: 20, color: Colors.black),
            titlePadding:
                EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
            title: const Text(
              'You need to delete this comment?',
            ),
            actionsPadding: EdgeInsets.only(bottom: 20, right: 20),
            actions: <Widget>[
              Container(
                height: 40,
                width: 70,
                decoration: BoxDecoration(
                    border: Border.all(color: PicmeColors.grayWhite),
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: Text(
                    'No',
                    style:
                        TextStyle(color: PicmeColors.grayBlack, fontSize: 18),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 70,
                decoration: BoxDecoration(
                    color: PicmeColors.mainColor,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () async {
                    deleteComment(context);
                    Navigator.pop(context, 'Yes');

                    // await SaverGallery.saveImage(100, name: name)
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
