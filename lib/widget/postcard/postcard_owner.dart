import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/posts.dart';
import 'package:picme/pages/boost_post/boost_post_page.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/pages/support/support_page.dart';
import 'package:picme/utils/colors.dart';

class PostCardOwner extends StatefulWidget {
  const PostCardOwner({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<PostCardOwner> createState() => _PostCardOwnerState();
}

class _PostCardOwnerState extends State<PostCardOwner> {
  @override
  Widget build(BuildContext context) {
    Image img = Image.network(widget.post.imageUrl);
    // Image img2 = Image.asset(widget.post.application);

    Image applicationImage = Image.asset('assets/procreate.png');

    if (widget.post.application == "procreate") {
      applicationImage = Image.asset('assets/procreate.png');
    }
    if (widget.post.application == "photoshop") {
      applicationImage = Image.asset('assets/photoshop.png');
    }
    if (widget.post.application == "ibis_paintX") {
      applicationImage = Image.asset('assets/ibispaint.jpg');
    }
    if (widget.post.application == "clip_studio_paint") {
      applicationImage = Image.asset('assets/clipstudio.pngg');
    }
    if (widget.post.application == "blender") {
      applicationImage = Image.asset('assets/blender.png');
    }
    // if (widget.post.application != "other") {}

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(minHeight: 493, maxWidth: 321),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.white,
              border: Border.all(width: 1)),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 20, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.post.ownerUsername,
                    style: GoogleFonts.poppins(
                      color: PicmeColors.grayBlack,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      LikeButton(
                        size: 24,
                        bubblesSize: 0,
                        isLiked: widget.post.isBooked,
                        circleColor: const CircleColor(
                            start: Color.fromARGB(255, 178, 184, 255),
                            end: Color.fromARGB(255, 106, 115, 215)),
                        likeBuilder: (isLiked) {
                          return Icon(
                            isLiked
                                ? CupertinoIcons.bookmark_fill
                                : CupertinoIcons.bookmark,
                            color: isLiked
                                ? PicmeColors.mainColor
                                : PicmeColors.mainColor,
                          );
                        },
                        onTap: (isBookmark) async {
                          if (isBookmark == false) {
                            Caller.dio
                                .post("/post/bookmark", data: {
                                  "postid": widget.post.postId,
                                })
                                .then((response) {})
                                .onError((DioException error, _) {
                                  Caller.handle(context, error);
                                });
                          } else {
                            Caller.dio
                                .delete("/post/unbookmark", data: {
                                  "postid": widget.post.postId,
                                })
                                .then((response) {})
                                .onError((DioException error, _) {
                                  Caller.handle(context, error);
                                });
                          }
                          return !isBookmark;
                        },
                      ),
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
                        itemBuilder: (ctx) => [
                          _buildPopupMenuItem('Delete'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 321,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: img.image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  LikeButton(
                    padding: EdgeInsets.only(left: 24),
                    size: 24,
                    likeCount: widget.post.likeCount,
                    isLiked: widget.post.isLiked,
                    likeBuilder: (isLiked) {
                      return Icon(
                        isLiked
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color:
                            isLiked ? Color(0xFFF44336) : PicmeColors.mainColor,
                      );
                    },
                    onTap: (isLiked) async {
                      log(isLiked.toString());
                      if (isLiked == false) {
                        Caller.dio
                            .post("/post/like", data: {
                              "postid": widget.post.postId,
                            })
                            .then((response) {})
                            .onError((DioException error, _) {
                              Caller.handle(context, error);
                            });
                      } else {
                        Caller.dio
                            .delete("/post/unlike", data: {
                              "postid": widget.post.postId,
                            })
                            .then((response) {})
                            .onError((DioException error, _) {
                              Caller.handle(context, error);
                            });
                      }
                      return !isLiked;
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()),
                      );
                    },
                    icon: const Icon(CupertinoIcons.bubble_middle_bottom),
                    color: PicmeColors.mainColor,
                    iconSize: 24,
                  ),
                  Text(
                    widget.post.commentCount.toString(),
                    style: TextStyle(color: Color(0xff9E9E9E)),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: applicationImage.image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      backgroundColor: PicmeColors.mainColor),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BoostPostPage()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 24,
                    width: 54,
                    decoration: BoxDecoration(
                      // color: PicmeColors.mainColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Boost',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(
                  top: 5, bottom: 10, left: 24, right: 24),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(widget.post.caption ?? " ",
                    style: GoogleFonts.poppins(
                      color: PicmeColors.grayBlack,
                      fontSize: 12,
                    )),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

PopupMenuItem _buildPopupMenuItem(
  String title,
) {
  return PopupMenuItem(
    height: 20,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ],
    ),
  );
}
