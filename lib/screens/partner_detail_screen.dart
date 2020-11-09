import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adc_nakama/color_palette.dart';

class PartnerDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, top: 24),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                    Text("Partner Title",
                        style: GoogleFonts.poppins(
                          color: textTitleCard2,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  color: Colors.grey,
                ),
                //* Jadwal
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Partner",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            letterSpacing: 0.24,
                            fontWeight: FontWeight.w600,
                            color: blueTitleDoktor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "International SOS",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            letterSpacing: 0.24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "06 Aug 2020",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            letterSpacing: 0.24,
                            //fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                      SizedBox(height: 180)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
