import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TentangKami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 25.0,
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
        ),
      ),
    );
  }
}
