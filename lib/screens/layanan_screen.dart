import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adc_nakama/color_palette.dart';
import 'package:adc_nakama/main.dart';

class LayananScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            //* Layanan
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Layanan",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 24)),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //* End Layanan
            //* Search Bar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                style: TextStyle(fontSize: 14, color: Colors.black),
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Search dokter, fasilitas & layanan',
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
            //* Fasilitas & Layanan Terkini
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 30, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fasilitas & Layanan Terkini",
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
                    height: 200,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return cardFasilitasLayanan(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            //* End Fasilitas & Layanan Terkini
            //* Event & Promo
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Event & Promo",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: textTitleCategory,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.24)),
                    SizedBox(
                      height: 25,
                    ),
                    cardEventPromo(context),
                    cardEventPromo(context),
                  ],
                )),
            //* End Event & Promo
          ],
        ),
      ),
    );
  }

  // Card Fasilitas & Layanan
  Widget cardFasilitasLayanan(BuildContext context) => GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FasilitasPage(),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 180,
        margin: EdgeInsets.only(right: 10, left: 5),
        padding: EdgeInsets.only(top: 120),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderCard)),
        child: Container(
          padding: EdgeInsets.only(left: 10, top: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topRight, stops: [
            0.01,
            1
          ], colors: [
            Colors.black.withOpacity(0.0),
            Colors.black.withOpacity(0.15)
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kamar",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                    letterSpacing: 0.24),
              ),
              Text(
                "Operasi",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                    letterSpacing: 0.24),
              ),
            ],
          ),
        ),
      ));

  // Card Event & Promo
  Widget cardEventPromo(BuildContext context) => GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventPage(),
          ),
        );
      },
      child: Container(
        height: 200,
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
              width: MediaQuery.of(context).size.width,
              height: 76,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event",
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
                      "Cara Membuat Sabun Herbal Sendiri, Bisa Pilih Aroma da..",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.24),
                      overflow: TextOverflow.ellipsis,
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
