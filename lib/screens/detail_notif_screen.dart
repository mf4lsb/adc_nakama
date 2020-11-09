import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adc_nakama/color_palette.dart';

class DetailNotifScreen extends StatelessWidget {
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
                    Text("Detail",
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
        body: Container(
          height: 150,
          color: Colors.grey,
        ));
  }
}
