import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adc_nakama/color_palette.dart';
import 'package:adc_nakama/main.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            //* Partner & Career
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Partner & Career",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 24)),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //* End Partner Career
            //* Search Bar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                style: TextStyle(fontSize: 14, color: Colors.black),
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Search Event & Promo',
                  prefixIcon: Icon(Icons.search, color: Colors.grey, size: 16),
                  hintStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white.withOpacity(0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.grey, width: .5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.grey, width: .5),
                  ),
                ),
              ),
            ),
            //* End Search Bar
            //* Partner
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 30, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Partner",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.24)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return cardPartner(context, index);
                      },
                    ),
                  ),
                ],
              ),
            ),
            //* End Partner
            //* Lowongan
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Lowongan",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: textTitleCategory,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.24)),
                    SizedBox(
                      height: 25,
                    ),
                    cardLowongan("Tes"),
                    // cardLowongan(context),
                  ],
                )),
            //* End Lowongan
          ],
        ),
      ),
    );
  }

  // Card Partner
  Widget cardPartner(BuildContext context, int index) => GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PartnerDetailPage(),
          ),
        );
      },
      child: Container(
        width: 120,
        margin: EdgeInsets.only(right: 10, left: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderCard)),
        child: Image.asset('assets/alodokter.png'),
      ));

  // Card Lowongan
  Widget cardLowongan(String a) => GestureDetector(
          /* onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventPage(),
          ),
        );
      },*/
          child: Container(
        height: 230,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: borderCard),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)))),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 7.5, horizontal: 12),
              height: 100,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lowongan",
                      style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.24,
                          fontSize: 10),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Perawat (S1 Kep.,Ners, Memiliki STR yang berlaku, IPK Min : 3, Perempuan/ Laki-laki)",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.24),
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "23 Sep 2020",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          letterSpacing: 0.24,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
}
