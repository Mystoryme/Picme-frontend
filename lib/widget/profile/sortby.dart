import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/utils/colors.dart';

class SortBy extends StatefulWidget {
  const SortBy({super.key});

  @override
  State<SortBy> createState() => _SortByState();
}

class _SortByState extends State<SortBy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 34),
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(
          'Sort By',
          style: GoogleFonts.poppins(
            fontSize: 12,
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
          offset: Offset(-15, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          itemBuilder: (ctx) => [
            _buildPopupMenuItem('Date', Icons.calendar_today),
            _buildPopupMenuItem('Liked', CupertinoIcons.heart),
          ],
        ),
      ]),
    );
  }
}

PopupMenuItem _buildPopupMenuItem(String title, IconData iconData) {
  return PopupMenuItem(
    height: 33,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: PicmeColors.mainColor),
        ),
        Icon(
          iconData,
          color: PicmeColors.mainColor,
          size: 15,
        )
      ],
    ),
  );
}
