import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/edit_profile_page.dart';
import 'package:picme/utils/colors.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  bool selected = true;
  bool selected2 = true;
  bool selected3 = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 34, left: 34),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                selected = !selected;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
            icon: selected
                ? Icon(
                    CupertinoIcons.square,
                    size: 33,
                    color: PicmeColors.mainColor,
                  )
                : Icon(
                    CupertinoIcons.square_fill,
                    size: 33,
                    color: PicmeColors.mainColor,
                  ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                selected2 = !selected2;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
            icon: selected2
                ? Icon(
                    CupertinoIcons.square_grid_2x2,
                    size: 33,
                    color: PicmeColors.mainColor,
                  )
                : Icon(
                    CupertinoIcons.square_grid_2x2_fill,
                    size: 33,
                    color: PicmeColors.mainColor,
                  ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                selected3 = !selected3;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
            icon: selected3
                ? Icon(
                    CupertinoIcons.bookmark,
                    size: 33,
                    color: PicmeColors.mainColor,
                  )
                : Icon(
                    CupertinoIcons.bookmark_fill,
                    size: 33,
                    color: PicmeColors.mainColor,
                  ),
          ),
        ],
      ),
    );
  }
}
