import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:picme/pages/boost_post/boost_post_page.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/pages/support/support_page.dart';
import 'package:picme/utils/colors.dart';

class PostCardOwner extends StatefulWidget {
  const PostCardOwner({super.key});

  @override
  State<PostCardOwner> createState() => _PostCardOwnerState();
}

class _PostCardOwnerState extends State<PostCardOwner> {
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
                    'Username',
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
                      PopupMenuButton(
                        padding: EdgeInsets.only(right: 3),
                        color: PicmeColors.mainColor,
                        elevation: 1,
                        tooltip: "",
                        icon: Icon(
                          CupertinoIcons.ellipsis_vertical,
                          color: PicmeColors.mainColor,
                        ),
                        offset: Offset(-15, 45),
                        shape: RoundedRectangleBorder(
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
                    likeCount: 4,
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
