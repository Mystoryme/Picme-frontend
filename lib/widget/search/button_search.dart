import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/utils/colors.dart';

class ButtonSearch extends StatefulWidget {
  const ButtonSearch(
      {Key? key,
      required this.search,
      required this.textFocusNode,
      required this.reload})
      : super(key: key);
  final TextEditingController search;
  final FocusNode textFocusNode;
  final void Function() reload;

  @override
  State<ButtonSearch> createState() => _ButtonSearchState();
}

class _ButtonSearchState extends State<ButtonSearch> {
  void _clearTextField(TextEditingController controller) {
    // Clear everything in the text field
    controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 10),
      child: Row(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: Container(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: TextFormField(
                focusNode: widget.textFocusNode,
                onTap: () => widget.reload(),
                onChanged: ((value) {
                  setState(() {});
                }),
                controller: widget.search,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.all(10.0), // Set the content padding
                  prefixIcon: Icon(
                    Icons.search,
                    color: PicmeColors.mainColor,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: 'Search',
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
                          onPressed: (() => _clearTextField(widget.search)),
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
        ],
      ),
    );
  }
}
