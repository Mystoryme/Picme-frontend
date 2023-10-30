import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/utils/colors.dart';

class TextComment extends StatefulWidget {
  const TextComment({
    Key? key,
    required this.search,
    required this.textFocusNode,
  }) : super(key: key);
  final TextEditingController search;
  final FocusNode textFocusNode;

  @override
  State<TextComment> createState() => _TextCommentState();
}

class _TextCommentState extends State<TextComment> {
  void _clearTextField(TextEditingController controller) {
    // Clear everything in the text field
    controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: PicmeColors.grayWhite,
          borderRadius: BorderRadius.circular(15), // Set the border radius
        ),
        child: Row(
          children: [
            // Replace Icon with CircleAvatar
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            const SizedBox(width: 8), // Add some spacing
            Expanded(
              child: Container(
                child: TextFormField(
                  focusNode: widget.textFocusNode,
                  controller: widget.search,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.all(10.0), // Set the content padding
                    prefixIcon: null, // Remove the prefix Icon
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Add a comment...',
                    hintStyle: const TextStyle(
                      color: Color(0xFFA0A5D8),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    fillColor: const Color.fromRGBO(243, 242, 242, 1),
                    filled: true,
                    suffixIcon: widget.search.text.isEmpty
                        ? null
                        : IconButton(
                            onPressed: () => _clearTextField(widget.search),
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
              ),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {},
              child: Text(
                'Post',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(PicmeColors.mainColor),
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
