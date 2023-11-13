import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/pages/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picme/pages/payment_success_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:picme/widget/addimage/captionform.dart';
import 'package:picme/widget/addimage/choice.dart';
import 'dart:io';
import 'package:picme/widget/check_image/import_image.dart';

class AddImagePage extends StatefulWidget {
  AddImagePage({Key? key, required this.onItemTapped}) : super(key: key);
  static const routeName = "/add_image_page";

  final void Function(int) onItemTapped;

  @override
  State<AddImagePage> createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage> {
  final TextEditingController _caption = TextEditingController();
  XFile? _pickedImage;
  String category = 'painting';
  String application = 'procreate';

  void submit() {
    // Post multipart form using Dio and senf _pickedImage in key of file
    FormData formData = FormData.fromMap({
      "category": category,
      "application": application,
      "caption": _caption.text,
      "file": MultipartFile.fromFileSync(_pickedImage!.path,
          filename: _pickedImage!.path.split("/").last)
    });

    Caller.dio.post("/post/create", data: formData).then((response) {
      SnackBar snackBar = const SnackBar(
        content: Text('Successfully posted!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      widget.onItemTapped(0);
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
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
                        submit();
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
          ImportImage(
            pickedImage: _pickedImage,
            setPickedImage: (XFile f) {
              setState(() {
                _pickedImage = f;
              });
            },
          ),
          CaptionForm(
            caption: _caption,
          ),
          Choice(
            updateCategory: (value) {
              setState(() {
                category = value;
              });
            },
            updateApplication: (value) {
              setState(() {
                application = value;
              });
            },
          ),
        ]),
      ),
    )));
  }
}
