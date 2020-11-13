import 'package:adc_nakama/screens/multi_purpose_screen.dart';
import 'package:adc_nakama/services/lowongan_services.dart';
import 'package:adc_nakama/services/partner_services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adc_nakama/color_palette.dart';

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
                    child: FutureBuilder(
                        future: PartnerServices.getPartner(context),
                        builder: (context, snapshot) {
                          dynamic data = snapshot.data;
                          return (snapshot.hasData)
                              ? (snapshot.data != null)
                                  ? ListView.builder(
                                      itemCount: data.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return cardPartner(
                                            context, index, data[index]);
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
                    FutureBuilder(
                        future: LowonganServices.getLowongan(context),
                        builder: (context, snapshot) {
                          dynamic data = snapshot.data;
                          return (snapshot.hasData)
                              ? (snapshot.data != null)
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return cardLowongan(
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
  Widget cardPartner(BuildContext context, int index, dynamic data) =>
      GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MultiPurposeScreen(data: data, keterangan: "Partner"),
              ),
            );
          },
          child: Container(
            width: 120,
            margin: EdgeInsets.only(right: 10, left: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderCard)),
            child: Hero(
              tag: data.id,
              child: CachedNetworkImage(
                imageUrl: data.picture,
                fit: BoxFit.fill,
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
          ));

  // Card Lowongan
  Widget cardLowongan(BuildContext context, dynamic data) => GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MultiPurposeScreen(
              data: data,
              keterangan: "Lowongan",
            ),
          ),
        );
      },
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
                  errorWidget:
                      (BuildContext context, String url, dynamic error) {
                    print(error);
                    return Icon(Icons.error_outline);
                  },
                ),
              ),
            ),
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
                      data.namaLowongan,
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
