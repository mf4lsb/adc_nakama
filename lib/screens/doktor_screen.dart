import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../color_palette.dart';
import 'booking_confirm_screen.dart';

// enum SingingCharacter { pria, wanita, none }

class DoktorScreen extends StatefulWidget {
  final dynamic dokter;

  DoktorScreen({Key key, this.dokter}) : super(key: key);

  @override
  _DoktorScreenState createState() => _DoktorScreenState();
}

class _DoktorScreenState extends State<DoktorScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();

  bool _btnEnabled = false;
  bool _loading = false;
  bool _loadingBuatJanji = false;

  // SingingCharacter _character = SingingCharacter.none;
  String _character = "none";

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    noHpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: widget.dokter.picture,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: CachedNetworkImage(
                  imageUrl: widget.dokter.picture,
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
            SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.6,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "dr. " +
                                    widget.dokter.name.first +
                                    " " +
                                    widget.dokter.name.last,
                                style: GoogleFonts.poppins(
                                    color: textTitleCard2,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/spesialis.svg",
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.dokter.workingAs,
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: subtitleDoktor),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 31,
                            ),
                            //* Jadwal
                            Text(
                              "Jadwal",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  letterSpacing: 0.24,
                                  fontWeight: FontWeight.w600,
                                  color: blueTitleDoktor),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.dokter.jadwalHari.hariSatu),
                                    Text(widget.dokter.jadwalJam.shiftSatu)
                                  ],
                                ),
                                Text(_tempatKerja(
                                    widget.dokter.tempatKerja.index))
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.dokter.jadwalHari.hariDua),
                                    Text(widget.dokter.jadwalJam.shiftDua)
                                  ],
                                ),
                                Text(_tempatKerja(
                                    widget.dokter.tempatKerja.index))
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.dokter.jadwalHari.hariTiga),
                                    Text(widget.dokter.jadwalJam.shiftTiga)
                                  ],
                                ),
                                Text(_tempatKerja(
                                    widget.dokter.tempatKerja.index))
                              ],
                            ),
                            //* End Jadwal
                            SizedBox(
                              height: 24,
                            ),
                            //* Biografi
                            Text(
                              "Biografi",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  letterSpacing: 0.24,
                                  fontWeight: FontWeight.w600,
                                  color: blueTitleDoktor),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(widget.dokter.biografi),
                            //* End Biografi
                            SizedBox(
                              height: 24,
                            ),
                            //* Kredensial
                            Text(
                              "Kredensial",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  letterSpacing: 0.24,
                                  fontWeight: FontWeight.w600,
                                  color: blueTitleDoktor),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(widget.dokter.kredensial),
                            //* End Kredensial
                            SizedBox(
                              height: 24,
                            ),
                            //* Afliansi Akademik
                            Text(
                              "Afliansi Akademik",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  letterSpacing: 0.24,
                                  fontWeight: FontWeight.w600,
                                  color: blueTitleDoktor),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(widget.dokter.afliansiAkademik),
                            //* End Afliansi Akademik
                            SizedBox(height: 180)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 12,
              left: 20,
              // child: IconButton(
              //   icon: Container(
              //     padding: const EdgeInsets.all(4),
              //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.white),
              //     child: Icon(Icons.arrow_back)
              //   ),
              //   onPressed: () => Navigator.of(context).pop(),
              // ),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                            spreadRadius: 0,
                            blurRadius: 12,
                            offset: Offset(0, 4)),
                      ]),
                  child: Center(
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 76,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.06),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(0, -4)),
        ]),
        child: ButtonTheme(
          height: 44,
          child: RaisedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              if (prefs.getString('email') != null) {
                setState(() {
                  _loadingBuatJanji = true;
                });
                _loadingBuatJanji = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BookingConfirm(
                              nama: prefs.getStringList('nama')[0],
                              gender: prefs.getStringList("gender")[0],
                              hp: prefs.getString('noHp'),
                              email: prefs.getString('email'),
                              namaDokter: widget.dokter.name,
                              spesialis: widget.dokter.workingAs,
                              fotoDokter: widget.dokter.picture,
                              status: prefs.getStringList('status')[0],
                            )));
              } else {
                _settingModalBottomSheet(
                    context,
                    _formKey,
                    _character,
                    nameController,
                    emailController,
                    noHpController,
                    _btnEnabled,
                    _loading,
                    widget.dokter.name,
                    widget.dokter.workingAs,
                    widget.dokter.picture);
              }
            },
            color: blueTitleDoktor,
            child: (_loadingBuatJanji == false)
                ? Text(
                    "Buat Janji",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  )
                : SpinKitFadingCircle(
                    color: Colors.white,
                  ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          ),
        ),
      ),
    );
  }

  String _tempatKerja(index) {
    if (index == 0) {
      return "KLINIK NAKAMA";
    } else {
      return "RS NAKAMA";
    }
  }
}

void _settingModalBottomSheet(
    BuildContext context,
    key,
    String character,
    name,
    email,
    noHp,
    btnConditions,
    loading,
    doctorName,
    specialist,
    doctorPicture) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      builder: (BuildContext context) {
        character = character;
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter mystate) {
          return AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: FractionallySizedBox(
              heightFactor: 0.8,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    // mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Container(
                        width: 33,
                        height: 4,
                        color: Color(0xFFCECDD1),
                        margin: const EdgeInsets.only(top: 10),
                      )),
                      SizedBox(height: 26),
                      Text(
                        "Maaf, anda belum terdaftar dalam aplikasi. Harap daftar terlebih dahulu untuk dapat membooking jadwal dengan dokter yang bersangkutan",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: textSubTitleCard2),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Form(
                        key: key,
                        onChanged: () => mystate(
                            () => btnConditions = key.currentState.validate()),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nama",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: textSubTitleCard2),
                            ),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                controller: name,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Anda tidak dapat mengkosongkan ini!";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Nama",
                                    helperText: "",
                                    hintStyle: GoogleFonts.poppins(
                                        color: subtitleList,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue))),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Jenis Kelamin",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: textSubTitleCard2),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: "Laki Laki",
                                    groupValue: character,
                                    onChanged: (String value) {
                                      mystate(() {
                                        character = value;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  "Laki Laki",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: (character != "Laki Laki")
                                          ? subtitleList
                                          : Colors.black),
                                ),
                                SizedBox(
                                  width: 34,
                                ),
                                Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: "Perempuan",
                                  groupValue: character,
                                  onChanged: (String value) {
                                    mystate(() {
                                      character = value;
                                    });
                                  },
                                ),
                                Text(
                                  "Perempuan",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: (character != "Perempuan")
                                          ? subtitleList
                                          : Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "No Handphone",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: textSubTitleCard2),
                            ),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                controller: noHp,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Anda tidak dapat mengkosongkan ini!";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "No handphone",
                                    helperText: "",
                                    hintStyle: GoogleFonts.poppins(
                                        color: subtitleList,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue))),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Email",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: textSubTitleCard2),
                            ),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                controller: email,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Anda tidak dapat mengkosongkan ini!";
                                  }

                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = RegExp(pattern);

                                  if (!regex.hasMatch(value)) {
                                    return "Email tidak valid";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Email",
                                    helperText: "",
                                    hintStyle: GoogleFonts.poppins(
                                        color: subtitleList,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue))),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ButtonTheme(
                                  minWidth:
                                      MediaQuery.of(context).size.width / 2.4,
                                  height: 44,
                                  child: RaisedButton(
                                    onPressed: () => Navigator.pop(context),
                                    color: greyButtonDoktor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Text(
                                      "Batal",
                                      style: GoogleFonts.poppins(
                                          color: textTitleCard2,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                ButtonTheme(
                                  minWidth:
                                      MediaQuery.of(context).size.width / 2.4,
                                  height: 44,
                                  child: RaisedButton(
                                      onPressed: (btnConditions == false ||
                                              character == "none")
                                          ? null
                                          : () async {
                                              mystate(() {
                                                loading = true;
                                              });

                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();

                                              // // Testing
                                              // print(prefs.getString('email'));
                                              // print(prefs.getString('noHp'));
                                              // print(prefs.getStringList('nama'));
                                              // print(prefs.getStringList('gender'));
                                              // print(prefs.getStringList('status'));

                                              if (prefs.getString('email') ==
                                                  null) {
                                                prefs.setString(
                                                    "email", email.text);
                                                prefs.setString(
                                                    'noHp', noHp.text);
                                                prefs.setStringList(
                                                    'nama', [name.text]);
                                                prefs.setStringList(
                                                    "gender", [character]);
                                                prefs.setStringList(
                                                    "status", ["Saya Sendiri"]);
                                              } else {
                                                prefs.remove('email');
                                                prefs.remove('noHp');
                                                prefs.remove('nama');
                                                prefs.remove("gender");
                                                prefs.remove("status");

                                                prefs.setString(
                                                    "email", email.text);
                                                prefs.setString(
                                                    'noHp', noHp.text);
                                                prefs.setStringList(
                                                    'nama', [name.text]);
                                                prefs.setStringList(
                                                    "gender", [character]);
                                                prefs.setStringList(
                                                    "status", ["Saya Sendiri"]);
                                              }

                                              loading = await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          BookingConfirm(
                                                              nama: name.text,
                                                              gender: character,
                                                              hp: noHp.text,
                                                              email: email.text,
                                                              namaDokter:
                                                                  doctorName,
                                                              spesialis:
                                                                  specialist,
                                                              fotoDokter:
                                                                  doctorPicture)));
                                            },
                                      color: blueTitleDoktor,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: (loading == false)
                                          ? Text(
                                              "Daftar",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                            )
                                          : SpinKitFadingCircle(
                                              color: Colors.white,
                                            )),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      });
}
