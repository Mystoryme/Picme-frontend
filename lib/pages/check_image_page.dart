import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:picme/widget/check_image/button_check.dart';
import 'package:picme/widget/check_image/import_image.dart';

class CheckImagePage extends StatelessWidget {
  const CheckImagePage({Key? key}) : super(key: key);
  static const routeName = "/check_image_page";

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
        child: Container(
          padding: const EdgeInsets.all(15.0),
          // alignment: Alignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Homepage()),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 150,
                  // ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Check Image',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   // crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     IconButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const Homepage()),
              //         );
              //       },
              //       icon: const Icon(
              //         Icons.clear,
              //         color: Color.fromRGBO(160, 165, 216, 100),
              //         size: 40,
              //       ),
              //     ),
              //   ],
              // ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImportImage(),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ButtonCheck(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
