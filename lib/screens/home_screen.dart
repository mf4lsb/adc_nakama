import 'package:adc_nakama/screens/tentang_kami_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adc_nakama/color_palette.dart';

import '../widget/carousel_home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            CarouselHome(),
            //* Temu Kami
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Temui Kami",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 18)),
                  SizedBox(
                    height: 16,
                  ),
                  Stack(
                    children: [
                      Image.asset('assets/maps.png'),
                      Positioned(
                        bottom: 17,
                        left: 17,
                        child: Container(
                          padding: const EdgeInsets.only(left: 8, right: 13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          width: 256,
                          height: 72,
                          child: Row(
                            children: [
                              Image.asset('assets/detail_place.png'),
                              SizedBox(
                                width: 13,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("RS. SMKDEV",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600)),
                                    Text(
                                      "Jl. Margacinta No. 29, Buah Batu, Bandung",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFBDBDBD)),
                                      // overflow: TextOverflow.ellipsis,
                                      overflow: TextOverflow.fade,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  rsInfo(),
                  SizedBox(
                    height: 20,
                  ),
                  rsInfo(),
                  SizedBox(
                    height: 20,
                  ),
                  rsInfo(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //* End Temui Kami
            //* Tentang Kami
            Container(
              color: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tentang Kami",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white,
                              letterSpacing: 0.24)),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TentangKami(),
                            ),
                          );
                        },
                        child: Text("Selengkapnya",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: Colors.white,
                                letterSpacing: 0.24)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 215,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return cardBlue(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            //* End Tentang kami
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 34, bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* Berita Terbaru
                    Text("Berita Terbaru",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: textTitleCategory,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.24)),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return cardBerita(context);
                        },
                      ),
                    ),
                    //* End Berita Terbaru
                    SizedBox(height: 45),
                    //* Kontak dan Pengaduan
                    Text("Kontak & Pengaduan",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: textTitleCategory,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.24)),
                    SizedBox(
                      height: 24,
                    ),
                    //* Location
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/location.svg",
                          width: 22,
                          height: 22,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rumah Sakit SMKDEV",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: textTitleCard2),
                            ),
                            Text(
                              "Jl. Margacinta No.29",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: textSubTitleCard2),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    //* Email
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/mail.svg",
                          width: 22,
                          height: 22,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          "info@smk.dev",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: textSubTitleCard2),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    //* Phone
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/phone.svg",
                              width: 22,
                              height: 22,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              "+622 7000 0000",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: textSubTitleCard2),
                            )
                          ],
                        ),
                        SizedBox(width: 37),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/building.svg",
                              width: 22,
                              height: 22,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              "+622 7000 0000",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: textSubTitleCard2),
                            )
                          ],
                        )
                      ],
                    ),
                    //* End Kontak dan Pengaduan
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget rsInfo() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Rumah Sakit SMKDEV",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 14)),
          SizedBox(
            height: 5,
          ),
          Text("Jl. Margacinta No.29",
              style: GoogleFonts.poppins(fontSize: 14)),
          SizedBox(
            height: 5,
          ),
          Text("Senin-Jumat : 08.00 - 20.00",
              style: GoogleFonts.poppins(fontSize: 14)),
          SizedBox(
            height: 5,
          ),
          Text("sabtu : 08.00 - 17.00",
              style: GoogleFonts.poppins(fontSize: 14)),
        ],
      );

  Widget cardBlue(BuildContext context) => Container(
        width: 133,
        height: 200,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderCard)),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              height: 76,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "dr. Setiawai, SpM",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: textTitleCard1,
                        letterSpacing: 0.24),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Katarak dan Bedan Refraktif",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 9,
                        color: textSubTitleCard1,
                        letterSpacing: 0.24),
                  )
                ],
              ),
            )
          ],
        ),
      );

  Widget cardBerita(BuildContext context) => Container(
        width: 196,
        height: 196,
        margin: EdgeInsets.only(right: 15),
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
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)))),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 7.5, horizontal: 12),
              width: MediaQuery.of(context).size.width,
              height: 76,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Training Center",
                    style: GoogleFonts.poppins(
                        color: textTitleCard1,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.24,
                        fontSize: 10),
                  ),
                  SizedBox(
                    height: 16.5,
                  ),
                  Text(
                    "Training Center bekerjasama dengan SMKDEV is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into elect",
                    style: GoogleFonts.poppins(
                        fontSize: 9,
                        color: textSubTitleCard1,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.24),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      );
}
