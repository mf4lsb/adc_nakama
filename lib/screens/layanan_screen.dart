import 'package:adc_nakama/screens/multi_purpose_screen.dart';
import 'package:adc_nakama/services/event_promo_services.dart';
import 'package:adc_nakama/services/fasilitas_services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adc_nakama/color_palette.dart';

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
                    child: FutureBuilder(
                        future: FasilitasServices.getFasilitas(context),
                        builder: (context, snapshot) {
                          dynamic data = snapshot.data;
                          return (snapshot.hasData)
                              ? (snapshot.data != null)
                                  ? ListView.builder(
                                      itemCount: data.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return cardFasilitasLayanan(
                                            context, data[index]);
                                      },
                                    )
                                  : Center(
                                      child: SpinKitFadingCircle(
                                      color: Colors.blue,
                                    ))
                              : Center(
                                  child: SpinKitFadingCircle(
                                  color: Colors.blue,
                                ));
                        }),
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
                    FutureBuilder(
                        future: EventPromoServices.getFasilitas(context),
                        builder: (context, snapshot) {
                          dynamic data = snapshot.data;
                          return (snapshot.hasData)
                              ? (snapshot.data != null)
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return cardEventPromo(
                                            context, data[index]);
                                      })
                                  : Center(
                                      child: SpinKitFadingCircle(
                                      color: Colors.blue,
                                    ))
                              : Center(
                                  child: SpinKitFadingCircle(
                                  color: Colors.blue,
                                ));
                        }),
                  ],
                )),
            //* End Event & Promo
          ],
        ),
      ),
    );
  }

  // Card Fasilitas & Layanan
  Widget cardFasilitasLayanan(BuildContext context, dynamic data) =>
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MultiPurposeScreen(data: data, keterangan: "Fasilitas"),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: borderCard),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.only(right: 10),
              child: Hero(
                tag: data.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: data.picture,
                    width: 150,
                    height: 180,
                    fit: BoxFit.cover,
                    placeholder: (BuildContext context, String url) => Center(
                        child: SpinKitFadingCircle(
                      color: Colors.blue,
                    )),
                    errorWidget:
                        (BuildContext context, String url, dynamic error) {
                      print(error);
                      return Icon(Icons.error_outline);
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 10,
              child: Text(
                data.namaTempat,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                    letterSpacing: 0.24),
              ),
            )
            // return str.split(' ').length;
          ],
        ),
      );
  // child: Container(
  //   width: 150,
  //   height: 180,
  //   margin: EdgeInsets.only(right: 10, left: 5),
  //   padding: EdgeInsets.only(top: 120),
  //   decoration: BoxDecoration(
  //       color: Colors.grey,
  //       borderRadius: BorderRadius.circular(8),
  //       border: Border.all(color: borderCard)),
  //   child: Container(
  //     padding: EdgeInsets.only(left: 10, top: 20),
  //     decoration: BoxDecoration(
  //         gradient: LinearGradient(begin: Alignment.topRight, stops: [
  //       0.01,
  //       1
  //     ], colors: [
  //       Colors.black.withOpacity(0.0),
  //       Colors.black.withOpacity(0.15)
  //     ])),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           "Kamar",
  //           style: GoogleFonts.poppins(
  //               fontWeight: FontWeight.w600,
  //               fontSize: 14,
  //               color: Colors.white,
  //               letterSpacing: 0.24),
  //         ),
  //         Text(
  //           "Operasi",
  //           style: GoogleFonts.poppins(
  //               fontWeight: FontWeight.w600,
  //               fontSize: 14,
  //               color: Colors.white,
  //               letterSpacing: 0.24),
  //         ),
  //       ],
  //     ),
  //   ),
  // ));

  // Card Event & Promo
  Widget cardEventPromo(BuildContext context, dynamic data) => GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MultiPurposeScreen(data: data, keterangan: data.keterangan),
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
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              child: Hero(
                tag: data.id,
                child: CachedNetworkImage(
                  imageUrl: data.picture,
                  fit: BoxFit.cover,
                  placeholder: (BuildContext context, String url) => Center(
                      child: SpinKitFadingCircle(
                    color: Colors.blue,
                  )),
                  errorWidget: (BuildContext context, String url, dynamic error) {
                    print(error);
                    return Icon(Icons.error_outline);
                  },
                ),
              ),
            ),
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
                      data.keterangan,
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
                      data.judul,
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
                      data.registered,
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
