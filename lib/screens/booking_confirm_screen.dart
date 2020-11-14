import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_palette.dart';
import 'ganti_pasien_screen.dart';

class BookingConfirm extends StatelessWidget {
  final String nama;
  final dynamic gender;
  final String hp;
  final String email;
  final String status;
  final dynamic namaDokter;
  final dynamic spesialis;
  final dynamic fotoDokter;
  BookingConfirm(
      {Key key,
      this.nama,
      this.gender,
      this.hp,
      this.email,
      this.status = "Saya Sendiri",
      this.namaDokter,
      this.spesialis,
      this.fotoDokter})
      : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // leading: Icon(Icons.arrow_back),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
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
                    child: CachedNetworkImage(
                      imageUrl: fotoDokter,
                      width: 58,
                      height: 58,
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
                  SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "dr " + "${namaDokter.first} " + "${namaDokter.last}",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: textTitleCard2),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "$spesialis",
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
                    "Nama : $nama",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8B8B8B),
                        letterSpacing: 0.24),
                  ),
                  Text(
                    "Jenis Kelamin : $gender",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8B8B8B),
                        letterSpacing: 0.24),
                  ),
                  Text(
                    "Status : $status",
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
                    height: 25,
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
                              contentPadding: EdgeInsets.only(
                                  top: 12, left: 16, bottom: 58),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFE0E0E0))),
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
