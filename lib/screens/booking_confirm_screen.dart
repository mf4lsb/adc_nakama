import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_palette.dart';
import 'ganti_pasien_screen.dart';

class BookingConfirm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // leading: Icon(Icons.arrow_back),
        iconTheme: IconThemeData(color: textTitleCard2),
        title: Text(
          "Booking Confirm",
          style: GoogleFonts.poppins(
              color: textTitleCard2, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Info Dokter
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 16, bottom: 24),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "https://awsimages.detik.net.id/community/media/visual/2016/12/20/56bebe68-da59-461d-b55a-491d598b71d5_43.jpg?w=700&q=90",
                        width: 58,
                        height: 58,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dokter 1",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: textTitleCard2),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Umum",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 0.38)),
                      )
                    ],
                  )
                ],
              ),
            ),
            //* End Info Dokter
            Container(
                width: MediaQuery.of(context).size.width,
                height: 4,
                color: Color(0xFFF4F4F4)),
            //* Booking Detail
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Booking Detail",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: blueTitleDoktor,
                    letterSpacing: 0.24),
              ),
            ),
            Container(
              color: Color(0xFFF4F4F4),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Booking Untuk",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: textTitleCard2,
                            letterSpacing: 0.24),
                      ),
                      InkWell(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => GantiPasien())),
                          child: Text(
                            "Ganti Pasien",
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: blueTitleDoktor,
                                letterSpacing: 0.24),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Nama : Irfan Trianto",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8B8B8B),
                        letterSpacing: 0.24),
                  ),
                  Text(
                    "Jenis Kelamin : Laki Laki",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8B8B8B),
                        letterSpacing: 0.24),
                  ),
                  Text(
                    "Status : Saya Sendiri",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8B8B8B),
                        letterSpacing: 0.24),
                  ),
                  //* End Booking Detail
                ],
              ),
            ),
            //* Tanggal Booking dan Pesan
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Booking Tanggal",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: textTitleCard2,
                            letterSpacing: 0.24),
                      ),
                      Row(
                        children: [
                          Text(
                            "Jumat, 23 Oct 2020",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFEE7421),
                                letterSpacing: 0.24),
                          ),
                          SizedBox(width: 15),
                          SvgPicture.asset("assets/icons/calendar_blue.svg",
                              width: 24, height: 24, fit: BoxFit.cover)
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pesan",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: textSubTitleCard2),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 12, left: 16, bottom: 58),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFE0E0E0))),
                              hintText: "Pesan",
                              helperText: "",
                              hintStyle: GoogleFonts.poppins(
                                color: subtitleList,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
            //* End Tanggal Booking dan Pesan
          ],
        ),
      ),
      bottomSheet: Container(
        height: 76,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.06),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(0, -4)),
        ]),
        child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width,
          height: 44,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          child: RaisedButton(
            color: blueTitleDoktor,
            onPressed: () {},
            child: Text(
              "Konfirmasi",
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 0.24),
            ),
          ),
        ),
      ),
    );
  }
}
