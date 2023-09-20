import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/utils/colors.dart';

class TextFormRegister extends StatefulWidget {
  const TextFormRegister(
      {Key? key,
      required this.email,
      required this.username,
      required this.password,
      required this.confirmpassword})
      : super(key: key);
  final TextEditingController email;
  final TextEditingController username;
  final TextEditingController password;
  final TextEditingController confirmpassword;

  @override
  State<TextFormRegister> createState() => _TextFormRegisterState();
}

class _TextFormRegisterState extends State<TextFormRegister> {
  void _clearTextField(TextEditingController controller) {
    // Clear everything in the text field
    controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

  void _clearTextField1(TextEditingController controller1) {
    // Clear everything in the text field
    controller1.clear();
    // Call setState to update the UI
    setState(() {});
  }

  void _clearTextField2(TextEditingController controller2) {
    // Clear everything in the text field
    controller2.clear();
    // Call setState to update the UI
    setState(() {});
  }

  void _clearTextField3(TextEditingController controller3) {
    // Clear everything in the text field
    controller3.clear();
    // Call setState to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create your account',
            style: GoogleFonts.poppins(
              color: PicmeColors.grayBlack,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            // textAlign: TextAlign.start,
            'Email*',
            style: GoogleFonts.poppins(
              color: PicmeColors.grayBlack,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
          ),
          TextFormField(
            onChanged: ((value) {
              setState(() {});
            }),
            controller: widget.email,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: PicmeColors.grayBlack),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              hintText: 'abc@gmail.com',

              fillColor: const Color.fromARGB(130, 255, 255, 255),
              filled: true,
              // suffixIcon: Padding(
              //   padding: EdgeInsets.all(0),
              //   child: Icon(Icons.clear),
              // ),
              suffixIcon: widget.email.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: (() => _clearTextField(widget.email)),
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
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Text(
            // textAlign: TextAlign.start,
            'Username*',
            style: GoogleFonts.poppins(
              color: PicmeColors.grayBlack,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
          ),
          TextFormField(
            onChanged: ((value) {
              setState(() {});
            }),
            controller: widget.username,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: PicmeColors.grayBlack),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              hintText: 'aaaaa',

              fillColor: const Color.fromARGB(130, 255, 255, 255),
              filled: true,
              // suffixIcon: Padding(
              //   padding: EdgeInsets.all(0),
              //   child: Icon(Icons.clear),
              // ),
              suffixIcon: widget.username.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: (() => _clearTextField1(widget.username)),
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
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Text(
            // textAlign: TextAlign.start,
            'Password*',
            style: GoogleFonts.poppins(
              color: PicmeColors.grayBlack,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                // top: 20,
                // right: 25,
                // left: 25,
                // bottom: 80,
                ),
            child: TextFormField(
              onChanged: ((value) {
                setState(() {});
              }),
              controller: widget.password,
              decoration: InputDecoration(
                // prefixIcon: const Icon(
                //   Icons.key_rounded,
                //   color: Color(0xFF141D3B),
                // ),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: PicmeColors.grayBlack),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                hintText: 'Your password',
                fillColor: const Color.fromARGB(130, 255, 255, 255),
                filled: true,
                // suffixIcon: Padding(
                //   padding: EdgeInsets.all(0),
                //   child: Icon(Icons.clear),
                // ),
                suffixIcon: widget.password.text.isEmpty
                    ? null
                    : IconButton(
                        onPressed: (() => _clearTextField2(widget.password)),
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.black54,
                        ),
                      ),
              ),
              autofocus: false,
              obscureText: true,
              // style: const GoogleFonts.poppins(color: Color(0xFF141D3B)
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF141D3B),
              ),

              cursorColor: Colors.black54,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
          ),
          Text(
            // textAlign: TextAlign.start,
            'Confirm Password*',
            style: GoogleFonts.poppins(
              color: PicmeColors.grayBlack,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(
            top: 10,
          )),
          Padding(
            padding: const EdgeInsets.only(
                // top: 20,
                // right: 25,
                // left: 25,
                // bottom: 80,
                ),
            child: TextFormField(
              onChanged: ((value) {
                setState(() {});
              }),
              controller: widget.confirmpassword,
              decoration: InputDecoration(
                // prefixIcon: const Icon(
                //   Icons.key_rounded,
                //   color: Color(0xFF141D3B),
                // ),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: PicmeColors.grayBlack),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                hintText: 'Your password',
                fillColor: const Color.fromARGB(130, 255, 255, 255),
                filled: true,
                // suffixIcon: Padding(
                //   padding: EdgeInsets.all(0),
                //   child: Icon(Icons.clear),
                // ),
                suffixIcon: widget.confirmpassword.text.isEmpty
                    ? null
                    : IconButton(
                        onPressed: (() =>
                            _clearTextField3(widget.confirmpassword)),
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.black54,
                        ),
                      ),
              ),
              autofocus: false,
              obscureText: true,
              // style: const GoogleFonts.poppins(color: Color(0xFF141D3B)
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF141D3B),
              ),

              cursorColor: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
