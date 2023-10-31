import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/post.dart';
import 'package:picme/pages/check_image_page.dart';
import 'package:picme/pages/search_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

enum Options { search, upload, copy, exit }

class Home_navbar extends StatefulWidget {
  const Home_navbar({super.key, required this.setCategory});

  final Function setCategory;

  @override
  State<Home_navbar> createState() => _Home_dropdownState();
}

class _Home_dropdownState extends State<Home_navbar> {


  var appBarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.only(left: 34.0),
          child: Row(
            children: [
              Text(
                'Home',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
              ),
              PopupMenuButton(
                elevation: 1,
                tooltip: "",
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                ),
                offset: Offset(-64, appBarHeight),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                itemBuilder: (ctx) => [
                  _buildPopupMenuItem('Painting', () {
                    widget.setCategory("painting");
                  }),
                  _buildPopupMenuItem('Drawing & Illustrations', () {
                    widget.setCategory("drawing");
                  }),
                  _buildPopupMenuItem('Mixed Media & Collage', () {
                    widget.setCategory("mixedmedia");
                  }),
                  _buildPopupMenuItem(
                    'Digital / Graphic',
                    () {
                      widget.setCategory("digital");
                    },
                  ),
                  _buildPopupMenuItem('Other ', () {
                    widget.setCategory("other");
                  })
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            // Padding(
            //   padding: EdgeInsets.only(right: 5.0),
            //   child: IconButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const CheckImagePage()),
            //       );
            //     },
            //     icon: const Icon(
            //       CupertinoIcons.checkmark_alt_circle,
            //       size: 33,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(right: 34.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchPage()),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  size: 33,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

PopupMenuItem _buildPopupMenuItem(String title, VoidCallback onTap2) {
  return PopupMenuItem(
    onTap: onTap2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: PicmeColors.mainColor),
        ),
      ],
    ),
  );
}
