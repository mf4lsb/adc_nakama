import 'package:flutter/material.dart';
import 'package:adc_nakama/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingSukses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: blueTitleDoktor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 105.0),
                child: Icon(Icons.check_circle),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  "Booking Sukses!",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFFFFFFFF),
                      fontSize: 24.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  "Kode booking anda",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFFFFFFFF),
                      fontSize: 12.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  "XXXXXXX",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFFFFFFFF),
                      fontSize: 24.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  "Custumer Service kami akan menghubungi anda untuk konfirmasi selanjutnya",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFFFFFFFF),
                      fontSize: 12.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 122.0,
                  right: 20.0,
                  left: 20.0,
                ),
                child: RaisedButton(
                  onPressed: () {},
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
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Tidak, Kembali ke home",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFFFFFFFF),
                        fontSize: 18.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
