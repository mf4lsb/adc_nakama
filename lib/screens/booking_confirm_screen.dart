import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import '../color_palette.dart';
import 'booking_sukses.dart';
import 'ganti_pasien_screen.dart';

class BookingConfirm extends StatefulWidget {
  final String nama;
  final dynamic gender;
  final String hp;
  final String email;
  final String status;
  final dynamic namaDokter;
  final dynamic spesialis;
  final dynamic fotoDokter;
  final int pasienAktif;
  BookingConfirm(
      {Key key,
      this.nama,
      this.gender,
      this.hp,
      this.email,
      this.status = "Saya Sendiri",
      this.namaDokter,
      this.spesialis,
      this.fotoDokter,
      this.pasienAktif})
      : super(key: key);

  @override
  _BookingConfirmState createState() => _BookingConfirmState();
}

class _BookingConfirmState extends State<BookingConfirm> {
  final _formKey = GlobalKey<FormState>();

  DateTime _dateTime;

  final TextEditingController pesanController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    pesanController.dispose();
  }

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
                      imageUrl: widget.fotoDokter,
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
                        "dr " + "${widget.namaDokter.first} " + "${widget.namaDokter.last}",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: textTitleCard2),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${widget.spesialis}",
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
            FutureBuilder(
                future: _getPasienAktif(),
                builder: (context, snapshot) {
                  dynamic data = snapshot.data;
                  return (snapshot.hasData)
                      ? (snapshot.data != null)
                          ? Container(
                              color: Color(0xFFF4F4F4),
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                          onTap: () async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => GantiPasien(
                                                          id: prefs.getInt(
                                                              'pasienAktif'),
                                                        )));

                                              setState(() {});
                                          },
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
                                    "Nama : ${data[0]}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF8B8B8B),
                                        letterSpacing: 0.24),
                                  ),
                                  Text(
                                    "Jenis Kelamin : ${data[1]}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF8B8B8B),
                                        letterSpacing: 0.24),
                                  ),
                                  Text(
                                    "Status : ${data[2]}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF8B8B8B),
                                        letterSpacing: 0.24),
                                  ),
                                  //* End Booking Detail
                                ],
                              ),
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
                            // "Jumat, 23 Oct 2020",
                            // DateFormat("EEEE", "id_ID").format(DateTime.now()),
                            // DateFormat.yMMMEd().format(DateTime.now()),
                            _dateTime == null ? "Pilih tanggal ->" : DateFormat.yMMMEd().format(_dateTime),
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFEE7421),
                                letterSpacing: 0.24),
                          ),
                          SizedBox(width: 15),
                          GestureDetector(
                            onTap: () => showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2021)).then((date) {
                                setState(() {
                                  _dateTime = date;
                                });
                              }),
                            child: SvgPicture.asset("assets/icons/calendar_blue.svg",
                                width: 24, height: 24, fit: BoxFit.cover),
                          )
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
                          controller: pesanController,
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
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              List<String> listDokter = prefs.getStringList('listDokter');
              List<String> listSpesialis = prefs.getStringList('listSpesialis');
              List<String> listFoto = prefs.getStringList('listFoto');
              List<String> listDate = prefs.getStringList('listDate');

              listDokter.add(widget.namaDokter);
              listSpesialis.add(widget.spesialis);
              listFoto.add(widget.fotoDokter);
              listDate.add(_dateTime.toString());

              prefs.remove("listDokter");
              prefs.remove("listSpesialis");
              prefs.remove("listFoto");
              prefs.remove("listDate");

              prefs.setStringList('listDokter', listDokter);
              prefs.setStringList('listSpesialis', listSpesialis);
              prefs.setStringList('listFoto', listFoto);
              prefs.setStringList('listDate', listFoto);

              Navigator.push(context, MaterialPageRoute(builder: (context) => BookingSukses()));
            },
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

  Future<List<String>> _getPasienAktif() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String nama = prefs.getStringList('nama')[prefs.getInt('pasienAktif')];
    String gender = prefs.getStringList('gender')[prefs.getInt('pasienAktif')];
    String status = prefs.getStringList('status')[prefs.getInt('pasienAktif')];

    return [nama, gender, status];
  }
}
