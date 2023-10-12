import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/utils/colors.dart';

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
