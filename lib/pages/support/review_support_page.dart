import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/pages/support/support_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:picme/widget/support/button_review_support.dart';
import 'package:picme/widget/support/detail_review_support.dart';

class ReviewSupportPage extends StatefulWidget {
  const ReviewSupportPage({Key? key}) : super(key: key);
  static const routeName = "/review_support_page";

  @override
  State<ReviewSupportPage> createState() => _ReviewSupportPageState();
}

class _ReviewSupportPageState extends State<ReviewSupportPage> {
  final TextEditingController _support = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
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
                                builder: (context) => const SupportPage()),
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
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        'Review',
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
                      'Review your support',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              DetailReviewSupport(),
              // TextFormSupport(
              //   support: _support,
              // ),
              const SizedBox(
                height: 380,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  textAlign: TextAlign.center,
                  'You won’t be charged until your ad is approved and starts running.',
                  style: GoogleFonts.poppins(
                    color: PicmeColors.grayBlack,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const ButtonReviewSupport(),
            ],
          ),
        ),
      ),
    ));
  }
}
