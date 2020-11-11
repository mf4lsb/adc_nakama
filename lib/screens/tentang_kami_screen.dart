import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TentangKami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  top: 25.0,
                  bottom: 7.0,
                ),
                child: Text(
                  "Tentang Kami",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF333333),
                      fontSize: 24.0),
                ),
              ),
              Image.asset(
                'assets/maps.png',
                width: 390.0,
                height: 219.0,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 59.0,
                  left: 24.0,
                ),
                child: Text(
                  "Mantap",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF2962FF),
                      fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
