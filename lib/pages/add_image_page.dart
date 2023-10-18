import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/home_page.dart';

import 'package:image_picker/image_picker.dart';
import 'package:picme/pages/payment_success_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:picme/widget/addimage/captionform.dart';
import 'package:picme/widget/addimage/choice.dart';
import 'dart:io';

import 'package:picme/widget/check_image/import_image.dart';

class AddImagePage extends StatelessWidget {
  AddImagePage({Key? key}) : super(key: key);
  static const routeName = "/add_image_page";

  final TextEditingController _caption = TextEditingController();

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      // User cancelled image selection
      return;
    }

    // Process the picked image, for example, display it
    // For demonstration purposes, we'll just print the image path.
    print('Image path: ${image.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(right: 34, left: 34),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0, top: 20),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()),
                      );
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xffA0A5D8),
                      size: 48,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0, backgroundColor: PicmeColors.mainColor),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homepage()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'Post',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          ImportImage(),
          CaptionForm(
            caption: _caption,
          ),
          const Choice()
        ]),
      ),
    )));
  }
}
