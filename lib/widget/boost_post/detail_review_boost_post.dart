import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/utils/colors.dart';

class DetailReviewBoostPost extends StatelessWidget {
  DetailReviewBoostPost({
    Key? key,
    required this.amount,
    required this.postId,
  }) : super(key: key);

  final int amount;
final int postId;

  @override
  Widget build(BuildContext context) {
    int total = amount * 69;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                ),
              ),
              Text(
                textAlign: TextAlign.right,
                'Budget',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 5,
                ),
              ),
              Text(
                textAlign: TextAlign.right,
                '69 THB per day',
                style: GoogleFonts.poppins(
                  color: PicmeColors.grayBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                ),
              ),
              Text(
                textAlign: TextAlign.right,
                'Number of days',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 5,
                ),
              ),
              Text(
                textAlign: TextAlign.right,
                amount.toString(),
                style: GoogleFonts.poppins(
                  color: PicmeColors.grayBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          // const Padding(
          //   padding: EdgeInsets.only(
          //     top: 15,
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                  ),
                ),
              ),
              Text(
                textAlign: TextAlign.right,
                'Payment',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // textAlign: TextAlign.justify,
                    'QR code',
                    style: GoogleFonts.poppins(
                      color: PicmeColors.grayBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                  ),
                ),
              ),
              Text(
                textAlign: TextAlign.right,
                'Ad cost summary',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // textAlign: TextAlign.right,
                    'Ad budget',
                    style: GoogleFonts.poppins(
                      color: PicmeColors.grayBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    // textAlign: TextAlign.right,
                    '69.00 THB',
                    style: GoogleFonts.poppins(
                      color: PicmeColors.grayBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // textAlign: TextAlign.right,
                    'Number of days',
                    style: GoogleFonts.poppins(
                      color: PicmeColors.grayBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    // textAlign: TextAlign.right,
                    amount.toString(),
                    style: GoogleFonts.poppins(
                      color: PicmeColors.grayBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textAlign: TextAlign.right,
                    'Total cost',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    // textAlign: TextAlign.right,
                    '${total} THB',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
