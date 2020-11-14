import 'dart:math';

import 'package:adc_nakama/screens/home_screen.dart';
import 'package:adc_nakama/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:adc_nakama/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingSukses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blueTitleDoktor,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/success.png"),
                  SizedBox(height: 24,),
                  Text(
                    "Booking Sukses!",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFFFFFFFF),
                        fontSize: 24.0),
                  ),
                  SizedBox(height: 16,),
                  Text(
                    "Kode booking anda",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFFFFFFFF),
                        fontSize: 12.0),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    _randomText(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFFFFFFFF),
                        fontSize: 24.0),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    "Customer Service kami akan menghubungi anda untuk konfirmasi selanjutnya",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFFFFFFFF),
                        fontSize: 12.0,), textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 44,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                      child: RaisedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen())),
                        color: Color(0xFFFFFFFF),
                        child: Text(
                          "Lihat Histori",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: Color(0xFF2962FF),
                              fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  FlatButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
                    child: Text(
                      "Tidak, Kembali ke home",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Color(0xFFFFFFFF),
                          fontSize: 18.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }

  String _randomText() {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return String.fromCharCodes(Iterable.generate(
        7, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length)))).toUpperCase();
  }
}
