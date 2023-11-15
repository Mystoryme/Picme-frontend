import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/models/profile.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/utils/colors.dart';

class TextComment extends StatefulWidget {
  const TextComment(
      {Key? key,
      required this.search,
      required this.textFocusNode,
      required this.profile,
      required this.callComment})
      : super(key: key);
  final TextEditingController search;
  final FocusNode textFocusNode;
  final Profile profile;
  final Function callComment;
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
          color: Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(15), // Set the border radius
        ),
        child: Row(
          children: [
            // Replace Icon with CircleAvatar
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.profile.avatarUrl ??
                  "https://cdn.crispedge.com/5d76cb.png"),
            ),
            const SizedBox(width: 8), // Add some spacing
            Expanded(
              child: Container(
                child: TextFormField(
                  onChanged: ((value) {
                    setState(() {});
                  }),
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
                    hintStyle: TextStyle(
                      color: PicmeColors.grayBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    fillColor: Color.fromARGB(255, 255, 255, 255),
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
            // TextButton(
            //   onPressed: () {
            //     widget.callComment();
            //     print("wow");
            //   },
            //   child: Text(
            //     'Post',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   style: ButtonStyle(
            //     backgroundColor:
            //         MaterialStateProperty.all(PicmeColors.mainColor),
            //   ),
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: PicmeColors.mainColor, elevation: 0),
              onPressed: () {
                widget.callComment();
                print("button press");
              },
              child: Container(
                alignment: Alignment.center,
                height: 35,
                decoration: BoxDecoration(
                  // color: PicmeColors.mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Post',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
