import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/utils/colors.dart';

const List<String> list = <String>[
  '1 day',
  '3 days',
  '5 days',
  '7 days',
  '14 days',
  '28 days'
];

class TextFormBoostPost extends StatefulWidget {
  TextFormBoostPost({
    Key? key,
    required this.boostpost,
    required this.onAmountSelected,
  }) : super(key: key);
  final TextEditingController boostpost;
  final ValueChanged<int> onAmountSelected;

  String dropdownValue = list.first;
  int getCurrentAmount() {
    RegExp regex = RegExp(r'(\d+)');
    Match? match = regex.firstMatch(dropdownValue);
    String numericPart = match?.group(0) ?? '0';

    // Convert the numeric part to an integer
    int amount = int.tryParse(numericPart) ?? 0;

    return amount;
  }

  @override
  State<TextFormBoostPost> createState() => _TextFormBoostPostState();
}

class _TextFormBoostPostState extends State<TextFormBoostPost> {
  void _clearTextField(TextEditingController controller) {
    // Clear everything in the text field
    controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
          ),
          Text(
            textAlign: TextAlign.right,
            'Budget',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
          ),
          TextFormField(
            readOnly: true,
            enabled: false,
            controller: widget.boostpost..text = '69 THB',
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: PicmeColors.grayBlack),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              labelText: 'Budget per day',

              fillColor: const Color.fromARGB(130, 255, 255, 255),
              filled: true,
              // suffixIcon: Padding(
              //   padding: EdgeInsets.all(0),
              //   child: Icon(Icons.clear),
              // ),
              // suffixIcon: widget.boostpost.text.isEmpty
              //     ? null
              //     : IconButton(
              //         onPressed: (() => _clearTextField(widget.boostpost)),
              //         icon: const Icon(
              //           Icons.clear,
              //           color: Colors.black54,
              //         ),
              //       ),
            ),
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF141D3B),
            ),
            cursorColor: Colors.black54,
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text(
            textAlign: TextAlign.right,
            'Duration',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
          ),
          // TextFormField(
          //   // readOnly: true,
          //   // enabled: false,
          //   // controller: widget.boostpost..text = '69 THB',
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //       borderSide: BorderSide(width: 2, color: PicmeColors.grayBlack),
          //       borderRadius: const BorderRadius.all(
          //         Radius.circular(5),
          //       ),
          //     ),
          //     labelText: 'Number of days',

          //     fillColor: const Color.fromARGB(130, 255, 255, 255),
          //     filled: true,
          //     // suffixIcon: Padding(
          //     //   padding: EdgeInsets.all(0),
          //     //   child: Icon(Icons.clear),
          //     // ),
          //     // suffixIcon: widget.boostpost.text.isEmpty
          //     //     ? null
          //     //     : IconButton(
          //     //         onPressed: (() => _clearTextField(widget.boostpost)),
          //     //         icon: const Icon(
          //     //           Icons.clear,
          //     //           color: Colors.black54,
          //     //         ),
          //     //       ),
          //   ),
          //   style: GoogleFonts.poppins(
          //     fontSize: 14,
          //     fontWeight: FontWeight.normal,
          //     color: const Color(0xFF141D3B),
          //   ),
          //   cursorColor: Colors.black54,
          // ),
          DropdownMenu<String>(
            initialSelection: list.first,
            onSelected: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                widget.dropdownValue = value!;
              });
              widget.onAmountSelected(widget.getCurrentAmount());
              InputDecoration(
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: PicmeColors.grayBlack),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              );
            },
            dropdownMenuEntries:
                list.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(
                value: value,
                label: value,
              );
            }).toList(),
            textStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF141D3B),
            ),
          )
        ],
      ),
    );
  }
}
