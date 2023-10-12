import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/utils/colors.dart';

class Choice extends StatefulWidget {
  const Choice({super.key});

  @override
  State<Choice> createState() => _ChoiceState();
}

List<String> options = [
  'Painting',
  'Drawing & Illustrations',
  'Mixed Media & Collage',
  'Digital / Graphic',
  'Other',
  'Procreate',
  'ibis PaintX',
  'Clip Studio Paint',
  'Blender',
  'Photoshop',
  'Other'
];

class _ChoiceState extends State<Choice> {
  String currentOption = options[0];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 36, bottom: 16, left: 9),
          child: Text(
            'Category',
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        Column(
          children: <Widget>[
            RadioListTile(
              contentPadding: EdgeInsets.all(0),
              activeColor: PicmeColors.mainColor,
              title: Text(
                'Painting',
                style: GoogleFonts.poppins(
                    fontWeight: (currentOption == options[0])
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: (currentOption == options[0])
                        ? PicmeColors.mainColor
                        : Colors.black),
              ),
              value: options[0],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
            RadioListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              activeColor: PicmeColors.mainColor,
              title: Text(
                'Drawing & Illustrations',
                style: GoogleFonts.poppins(
                    fontWeight: (currentOption == options[1])
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: (currentOption == options[1])
                        ? PicmeColors.mainColor
                        : Colors.black),
              ),
              value: options[1],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
            RadioListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              activeColor: PicmeColors.mainColor,
              title: Text(
                'Mixed Media & Collage',
                style: GoogleFonts.poppins(
                    fontWeight: (currentOption == options[2])
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: (currentOption == options[2])
                        ? PicmeColors.mainColor
                        : Colors.black),
              ),
              value: options[2],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
            RadioListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              activeColor: PicmeColors.mainColor,
              title: Text(
                'Digital / Graphic',
                style: GoogleFonts.poppins(
                    fontWeight: (currentOption == options[3])
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: (currentOption == options[3])
                        ? PicmeColors.mainColor
                        : Colors.black),
              ),
              value: options[3],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
            RadioListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              activeColor: PicmeColors.mainColor,
              title: Text(
                'Other ',
                style: GoogleFonts.poppins(
                    fontWeight: (currentOption == options[4])
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: (currentOption == options[4])
                        ? PicmeColors.mainColor
                        : Colors.black),
              ),
              value: options[4],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 9, top: 16),
          child: Text(
            'Appication used',
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        Column(
          children: <Widget>[
            RadioListTile(
              contentPadding: EdgeInsets.all(0),
              activeColor: PicmeColors.mainColor,
              title: Text(
                'Procreate',
                style: GoogleFonts.poppins(
                    fontWeight: (currentOption == options[5])
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: (currentOption == options[5])
                        ? PicmeColors.mainColor
                        : Colors.black),
              ),
              value: options[5],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
            RadioListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              activeColor: PicmeColors.mainColor,
              title: Text(
                'ibis PaintX',
                style: GoogleFonts.poppins(
                    fontWeight: (currentOption == options[6])
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: (currentOption == options[6])
                        ? PicmeColors.mainColor
                        : Colors.black),
              ),
              value: options[6],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
            RadioListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              activeColor: PicmeColors.mainColor,
              title: Text(
                'Clip Studio Paint',
                style: GoogleFonts.poppins(
                    fontWeight: (currentOption == options[7])
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: (currentOption == options[7])
                        ? PicmeColors.mainColor
                        : Colors.black),
              ),
              value: options[7],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
            RadioListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              activeColor: PicmeColors.mainColor,
              title: Text(
                'Blender',
                style: GoogleFonts.poppins(
                    fontWeight: (currentOption == options[8])
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: (currentOption == options[8])
                        ? PicmeColors.mainColor
                        : Colors.black),
              ),
              value: options[8],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
            RadioListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              activeColor: PicmeColors.mainColor,
              title: Text(
                'Photoshop',
                style: GoogleFonts.poppins(
                    fontWeight: (currentOption == options[9])
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: (currentOption == options[9])
                        ? PicmeColors.mainColor
                        : Colors.black),
              ),
              value: options[9],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
            RadioListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              activeColor: PicmeColors.mainColor,
              title: Text(
                'Other',
                style: GoogleFonts.poppins(
                    fontWeight: (currentOption == options[10])
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: (currentOption == options[10])
                        ? PicmeColors.mainColor
                        : Colors.black),
              ),
              value: options[10],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
