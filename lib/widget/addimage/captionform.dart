import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/utils/colors.dart';
import 'package:dio/dio.dart';


class CaptionForm extends StatefulWidget {
  const CaptionForm({Key? key, required this.caption}) : super(key: key);
  final TextEditingController caption;

  @override
  State<CaptionForm> createState() => _CaptionFormState();
}

class _CaptionFormState extends State<CaptionForm> {
  void _clearTextField(TextEditingController controller) {
    // Clear everything in the text field
    controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

  // Future<void> uploadImageAndCaption(File imageFile, String caption) async {
  //   try {
  //     final dio = Dio();
  //     final formData = FormData.fromMap({
  //       'image': await MultipartFile.fromFile(imageFile.path),
  //       'caption': caption,
  //     });
  //
  //     final response = await dio.post('YOUR_UPLOAD_API_URL',
  //         data: formData,
  //         options: Options(headers: {
  //           'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
  //         }));
  //
  //     if (response.statusCode == 200) {
  //       // Image and caption uploaded successfully
  //       // You can handle the response, display a success message, etc.
  //     } else {
  //       // Handle error, show a message, etc.
  //     }
  //   } catch (e) {
  //     // Handle exceptions, show an error message, etc.
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 3,
      onChanged: ((value) {
        setState(() {});
      }),
      controller: widget.caption,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: PicmeColors.grayWhite),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: PicmeColors.mainColor)),
        hintText: 'Write the detail ...',
        fillColor: const Color.fromARGB(130, 255, 255, 255),
        filled: true,
        suffixIcon: widget.caption.text.isEmpty
            ? null
            : IconButton(
                onPressed: (() => _clearTextField(widget.caption)),
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black54,
                ),
              ),
      ),
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: const Color(0xFF141D3B),
      ),
      cursorColor: Colors.black54,
    );
  }
}
