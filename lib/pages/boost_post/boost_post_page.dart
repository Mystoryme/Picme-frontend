import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/widget/boost_post/button_boost_post.dart';
import 'package:picme/widget/boost_post/textform_boost_post.dart';

class BoostPostPage extends StatefulWidget {
  const BoostPostPage({Key? key}) : super(key: key);
  static const routeName = "/boost_post_page";

  @override
  State<BoostPostPage> createState() => _BoostPostPageState();
}

class _BoostPostPageState extends State<BoostPostPage> {
  final TextEditingController _boostpost = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.only(left: 1),
                        child: Text(
                          'Budget & duration',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select your duration',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ]),
                ),
                TextFormBoostPost(
                  boostpost: _boostpost,
                ),
              ],
            ),

            // const SizedBox(
            //   height: 570,
            // ),
            const ButtonBoostPost(),
          ],
        ),
      ),
    ));
  }
}
