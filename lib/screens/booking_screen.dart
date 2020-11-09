import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adc_nakama/color_palette.dart';
import 'package:adc_nakama/screens/doktor_screen.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, top: 24),
                child: Text("Booking",
                    style: GoogleFonts.poppins(
                      color: textTitleCard2,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    )),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DoktorScreen())),
                child: ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        'https://awsimages.detik.net.id/community/media/visual/2016/12/20/56bebe68-da59-461d-b55a-491d598b71d5_43.jpg?w=700&q=90',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text("Dokter ${index + 1}",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: titleList)),
                  subtitle: Text(
                    "Umum",
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: subtitleList),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
