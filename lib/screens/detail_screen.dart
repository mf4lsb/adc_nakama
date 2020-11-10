import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_palette.dart';

class DetailScreen extends StatelessWidget {
  final TextStyle textStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 18, color: textTitleCard2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: textTitleCard2),
          title: Text(
            "Detail",
            style: textStyle,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kontrol Mingguan",
                  style: textStyle.copyWith(
                      color: blueTitleDoktor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.24),
                ),
                SizedBox(height: 4),
                Text(
                  "Waktunya Control",
                  style: textStyle.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 6,
                ),
                Text("06 Aug 2020",
                    style: textStyle.copyWith(
                        color: textSubTitleCard1,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.24)),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Kamis,",
                              style: textStyle.copyWith(
                                  color: textSubTitleCard2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                          Text(
                            "08.30",
                            style: textStyle.copyWith(
                                color: blueTitleDoktor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                    Container(
                      width: 1,
                      height: 55,
                      color: borderCard,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    Row(children: [
                      SvgPicture.asset('assets/icons/location.svg'),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rumah Sakit SMKDEV",
                              style: textStyle.copyWith(
                                  color: textTitleCard2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                          Text(
                            "Jl. Margacinta No. 29",
                            style: textStyle.copyWith(
                                color: textSubTitleCard2,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ]),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                RichText(
                  text: TextSpan(
                      text: "Amet - ",
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text:
                              "minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. \n\nAmet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. \n\nAmet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                          style: textStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: textTitleCard2.withOpacity(0.9)
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
