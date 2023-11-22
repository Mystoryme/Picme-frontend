// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:picme/utils/colors.dart';

// class TextFormSupport extends StatefulWidget {
//   const TextFormSupport({Key? key, required this.support}) : super(key: key);
//   final TextEditingController support;

//   @override
//   State<TextFormSupport> createState() => _TextFormSupportState();
// }

// class _TextFormSupportState extends State<TextFormSupport> {
//   void _clearTextField(TextEditingController controller) {
//     // Clear everything in the text field
//     controller.clear();
//     // Call setState to update the UI
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(
//               top: 20,
//             ),
//           ),
//           Text(
//             textAlign: TextAlign.right,
//             'Support your artist',
//             style: GoogleFonts.poppins(
//               color: Colors.black,
//               fontSize: 16,
//               fontWeight: FontWeight.normal,
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(
//               top: 10,
//             ),
//           ),
//           TextFormField(
//             onChanged: ((value) {
//               setState(() {});
//             }),
//             controller: widget.support,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(width: 2, color: PicmeColors.grayBlack),
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(5),
//                 ),
//               ),
//               labelText: 'Custom tips',

//               fillColor: const Color.fromARGB(130, 255, 255, 255),
//               filled: true,
//               // suffixIcon: Padding(
//               //   padding: EdgeInsets.all(0),
//               //   child: Icon(Icons.clear),
//               // ),
//               suffixIcon: widget.support.text.isEmpty
//                   ? null
//                   : IconButton(
//                       onPressed: (() => _clearTextField(widget.support)),
//                       icon: const Icon(
//                         Icons.clear,
//                         color: Colors.black54,
//                       ),
//                     ),
//             ),
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               fontWeight: FontWeight.normal,
//               color: const Color(0xFF141D3B),
//             ),
//             cursorColor: Colors.black54,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for FilteringTextInputFormatter
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/utils/colors.dart';

class TextFormSupport extends StatefulWidget {
  const TextFormSupport({Key? key, required this.support}) : super(key: key);
  final TextEditingController support;

  @override
  State<TextFormSupport> createState() => _TextFormSupportState();
}

class _TextFormSupportState extends State<TextFormSupport> {
  void _clearTextField(TextEditingController controller) {
    // Clear everything in the text field
    controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

  // int amount = 0; // Variable to store the numeric value

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
            'Support your artist',
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
            // onChanged: (value) {
            //   // Parse the entered text to an integer and assign it to the amount variable

            //   setState(() {
            //     amount = int.tryParse(value) ?? 0;
            //   });
            // },
            controller: widget.support,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: PicmeColors.grayBlack),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              labelText: 'Custom tips',
              fillColor: const Color.fromARGB(130, 255, 255, 255),
              filled: true,
              suffixIcon: widget.support.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () => _clearTextField(widget.support),
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
            // Add input formatter to allow only numeric values
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ],
      ),
    );
  }
}
