import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/posts.dart';
import 'package:picme/models/homepost.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/pages/support/support_page.dart';
import 'package:picme/utils/colors.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({
    super.key,
    required this.post,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  HomePost? posts;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    Caller.dio.get("/profile/post").then((response) {
      setState(() {
        posts = HomePost.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    circleColor: const CircleColor(
                        start: Color.fromARGB(255, 178, 184, 255),
                        end: Color.fromARGB(255, 106, 115, 215)),
                    likeBuilder: (isTapped) {
                      return Icon(
                        isTapped
                            ? CupertinoIcons.bookmark_fill
                            : CupertinoIcons.bookmark,
                        color: isTapped
                            ? PicmeColors.mainColor
                            : PicmeColors.mainColor,
                      );
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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/sunset.jpg'),
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
                    likeBuilder: (isTapped) {
                      return Icon(
                        isTapped
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: isTapped
                            ? Color(0xFFF44336)
                            : PicmeColors.mainColor,
                      );
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
                    '4',
                    style: TextStyle(color: Color(0xff9E9E9E)),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/procreate.png'),
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
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          titleTextStyle: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.black),
                          titlePadding: EdgeInsets.only(
                              right: 20, left: 20, top: 20, bottom: 20),
                          title: const Text(
                            'You need to download this picture?',
                          ),
                          actionsPadding:
                              EdgeInsets.only(bottom: 20, right: 20),
                          actions: <Widget>[
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: PicmeColors.grayWhite),
                                  borderRadius: BorderRadius.circular(10)),
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
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
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
                            builder: (context) => const SupportPage()),
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
                child: Text(
                    'The perfect picture of the sky will always be sunset kefmwekfknjkgnwrg อะไรยาว ๆ อะไรยาว ๆ อะไรยาว ๆ อะไรยาว ๆ อะไรยาว ๆ อะไรยาว ๆ อะไรยาว ๆ  .',
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
