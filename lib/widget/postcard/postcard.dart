import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:like_button/like_button.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/posts.dart';
import 'package:picme/models/homepost.dart';
import 'package:picme/pages/comment/comment_page.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/pages/support/support_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:saver_gallery/saver_gallery.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({
    super.key,
    required this.post,
    required this.reload,
  });
  final VoidCallback reload;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  HomePost? posts;
  int? commentCount;
  Posts? post;

  @override
  void initState() {
    super.initState();
    // init();
  }

  // init() {
  //   Caller.dio.get("/post/list").then((response) {
  //     setState(() {
  //       posts = HomePost.fromJson(response.data["data"]);
  //     });
  //   }).onError((DioException error, _) {
  //     Caller.handle(context, error);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Image img = Image.network(widget.post.imageUrl);

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
      applicationImage = Image.asset('assets/clipstudio.png');
    }
    if (widget.post.application == "blender") {
      applicationImage = Image.asset('assets/blender.png');
    }
    if (widget.post.application == "other") {
      applicationImage = Image.asset('assets/other.png');
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Center(
        child: Container(
          constraints: BoxConstraints(minHeight: 493, maxWidth: 321),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.white,
              border: Border.all(width: 1)),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 24, top: 20, bottom: 15),
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
                  LikeButton(
                    padding: EdgeInsets.only(right: 24),
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
                            builder: (context) => CommentPage(
                                  postId: widget.post.postId,
                                  onDelete: widget.reload,
                                )),
                      ).then((response) async {
                        Caller.dio.post("/post/post_get", data: {
                          "postId": widget.post.postId,
                        }).then((response) {
                          setState(() {
                            post = Posts.fromJson(response.data["data"]);
                          });
                        }).onError((DioException error, _) {
                          Caller.handle(context, error);
                        });
                        setState(() {
                          commentCount = posts!.posts[0].commentCount;
                        });
                      });
                    },
                    icon: const Icon(CupertinoIcons.bubble_middle_bottom),
                    color: PicmeColors.mainColor,
                    iconSize: 24,
                  ),
                  Text(
                    commentCount != null
                        ? commentCount.toString()
                        : widget.post.commentCount.toString(),
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
              Row(
                children: [
                  IconButton(
                    hoverColor: Colors.white,
                    color: PicmeColors.grayBlack,
                    onPressed: () async {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          titleTextStyle: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.black),
                          titlePadding: EdgeInsets.only(
                              right: 20, left: 20, top: 20, bottom: 20),
                          title:
                              const Text('You need to download this picture?'),
                          actionsPadding:
                              EdgeInsets.only(bottom: 20, right: 20),
                          actions: <Widget>[
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: PicmeColors.grayWhite),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                      color: PicmeColors.grayBlack,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                color: PicmeColors.mainColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  // Save the image to the gallery
                                  await ImageDownloader.downloadImage(
                                      widget.post.imageUrl);

                                  Navigator.pop(context, 'Yes');
                                },
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Icon(Icons.save_alt_rounded),
                    iconSize: 24,
                  ),
                  IconButton(
                    hoverColor: Colors.white,
                    padding: EdgeInsets.only(right: 24),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SupportPage(
                                  postId: widget.post.postId,
                                )),
                      );
                    },
                    icon: Icon(CupertinoIcons.gift),
                    color: PicmeColors.grayBlack,
                    iconSize: 24,
                  ),
                ],
              )
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
