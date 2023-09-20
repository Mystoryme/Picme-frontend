import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/utils/colors.dart';

class TextFormEditProfile extends StatefulWidget {
  TextFormEditProfile(
      {Key? key,
      required this.username,
      required this.bio,
      required this.contact})
      : super(key: key);
  final TextEditingController username;
  final TextEditingController bio;
  final TextEditingController contact;

  @override
  State<TextFormEditProfile> createState() => _TextFormEditProfileState();
}

class _TextFormEditProfileState extends State<TextFormEditProfile> {
  void _clearTextField(TextEditingController controller) {
    // Clear everything in the text field
    controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

  // void _clearTextField1(TextEditingController controller1) {
  //   // Clear everything in the text field
  //   controller1.clear();
  //   // Call setState to update the UI
  //   setState(() {});
  // }

  // void _clearTextField2(TextEditingController controller2) {
  //   // Clear everything in the text field
  //   controller2.clear();
  //   // Call setState to update the UI
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            // textAlign: TextAlign.start,
            'User Name',
            style: GoogleFonts.poppins(
              color: PicmeColors.grayBlack,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
          ),
          TextFormField(
            onChanged: ((value) {
              setState(() {});
            }),
            controller: widget.username,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: PicmeColors.grayBlack),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              hintText: 'aaaaa',

              fillColor: const Color.fromARGB(130, 255, 255, 255),
              filled: true,
              // suffixIcon: Padding(
              //   padding: EdgeInsets.all(0),
              //   child: Icon(Icons.clear),
              // ),
              suffixIcon: widget.username.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: (() => _clearTextField(widget.username)),
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.black54,
                      ),
                    ),
            ),
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF141D3B),
            ),
            cursorColor: Colors.black54,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
          ),
          Text(
            // textAlign: TextAlign.start,
            'Bio',
            style: GoogleFonts.poppins(
              color: PicmeColors.grayBlack,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
          ),
          TextFormField(
            onChanged: ((value) {
              setState(() {});
            }),
            controller: widget.bio,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: PicmeColors.grayBlack),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              hintText: 'illustrator || Story artist || cat lover',

              fillColor: const Color.fromARGB(130, 255, 255, 255),
              filled: true,
              // suffixIcon: Padding(
              //   padding: EdgeInsets.all(0),
              //   child: Icon(Icons.clear),
              // ),
              suffixIcon: widget.bio.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: (() => _clearTextField(widget.bio)),
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.black54,
                      ),
                    ),
            ),
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF141D3B),
            ),
            cursorColor: Colors.black54,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
          ),
          Text(
            // textAlign: TextAlign.start,
            'Contact',
            style: GoogleFonts.poppins(
              color: PicmeColors.grayBlack,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
          ),
          TextFormField(
            // initialValue: 'Complete the story from here...',
            onChanged: ((value) {
              setState(() {});
            }),
            controller: widget.contact,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: PicmeColors.grayBlack),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              hintText: '081-234-5678',

              fillColor: const Color.fromARGB(130, 255, 255, 255),
              filled: true,
              // suffixIcon: Padding(
              //   padding: EdgeInsets.all(0),
              //   child: Icon(Icons.clear),
              // ),
              suffixIcon: widget.contact.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: (() => _clearTextField(widget.contact)),
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.black54,
                      ),
                    ),
            ),
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF141D3B),
            ),
            cursorColor: Colors.black54,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
          ),
        ],
      ),
    );
  }
}
