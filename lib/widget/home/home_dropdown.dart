import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picme/pages/check_image_page.dart';
import 'package:picme/pages/search_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

enum Options { search, upload, copy, exit }

class Home_navbar extends StatefulWidget {
  const Home_navbar({super.key});

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
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                ),
                offset: Offset(-64, appBarHeight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                itemBuilder: (ctx) => [
                  _buildPopupMenuItem('Painting'),
                  _buildPopupMenuItem('Drawing & Illustrations'),
                  _buildPopupMenuItem(
                    'Mixed Media & Collage',
                  ),
                  _buildPopupMenuItem(
                    'Digital / Graphic',
                  ),
                  _buildPopupMenuItem('Other ')
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CheckImagePage()),
                  );
                },
                icon: Icon(
                  CupertinoIcons.checkmark_alt_circle,
                  size: 33,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 34.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchPage()),
                  );
                },
                icon: Icon(
                  Icons.search,
                  size: 33,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        )
      ]),
      width: MediaQuery.of(context).size.width,
    );
  }
}

PopupMenuItem _buildPopupMenuItem(
  String title,
) {
  return PopupMenuItem(
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
