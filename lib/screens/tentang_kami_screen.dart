import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TentangKami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                    "Sekilas Tentang SMKDEV",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF2962FF),
                        fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 36.0,
                    bottom: 24.0,
                  ),
                  child: Text(
                    "SMK.DEV adalah komunitas developer siswa SMK jurusan Rekayasa Perangkat Lunak (RPL), Teknik Komputer dan Jaringan (TKJ) dan Multimedia (MM) dari seluruh Indonesia. Mereka adalah talenta yang bersemangat dan luar biasa berbakat serta kompetitif. Mereka bergabung untuk meningkatkan skill coding, menunjukkan keahlian mereka dan siap merealisasikan kebutuhan aplikasi untuk bisnis Anda. Didukung komunitas developer siswa SMK dari seluruh Indonesia, Kami siap untuk mewujudkan kebutuhan digital di perusahaan Anda",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF333333),
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/lokasi.png',
                  width: 150.0,
                  height: 150.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 114),
                  child: Text(
                    "Temui Kami \n\nRumah Sakit SMKDEV \nJl. Margacinta No. 29 \n\nKlinik SMKDEV \nJl. Mars Barat I No. 9",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF333333),
                        fontSize: 14.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
