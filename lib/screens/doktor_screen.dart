import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_palette.dart';
import 'booking_confirm_screen.dart';

enum SingingCharacter { pria, wanita, none }

class DoktorScreen extends StatefulWidget {
  @override
  _DoktorScreenState createState() => _DoktorScreenState();
}

class _DoktorScreenState extends State<DoktorScreen> {
  final _formKey = GlobalKey<FormState>();

  SingingCharacter _character = SingingCharacter.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 270,
              child: Image.network(
                "https://awsimages.detik.net.id/community/media/visual/2016/12/20/56bebe68-da59-461d-b55a-491d598b71d5_43.jpg?w=700&q=90",
                fit: BoxFit.cover,
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
                            Text("Dokter 1",
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
                                  "Umum",
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
                                    Text("Senin"),
                                    Text("08.00-14.00 WIB")
                                  ],
                                ),
                                Text("RS SMKDEV")
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
                                    Text("Selasa"),
                                    Text("08.00-14.00 WIB")
                                  ],
                                ),
                                Text("RS SMKDEV")
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
                                    Text("Rabu"),
                                    Text("08.00-10.00 WIB")
                                  ],
                                ),
                                Text("Klinik SMKDEV")
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
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
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
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
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
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
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
            onPressed: () =>
                _settingModalBottomSheet(context, _formKey, _character),
            color: blueTitleDoktor,
            child: Text(
              "Buat Janji",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          ),
        ),
      ),
    );
  }
}

void _settingModalBottomSheet(
    BuildContext context, key, SingingCharacter character) {
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
                                    value: SingingCharacter.pria,
                                    groupValue: character,
                                    onChanged: (SingingCharacter value) {
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
                                      color:
                                          (character != SingingCharacter.pria)
                                              ? subtitleList
                                              : Colors.black),
                                ),
                                SizedBox(
                                  width: 34,
                                ),
                                Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: SingingCharacter.wanita,
                                  groupValue: character,
                                  onChanged: (SingingCharacter value) {
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
                                      color:
                                          (character != SingingCharacter.wanita)
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
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => BookingConfirm())),
                                    color: blueTitleDoktor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Text(
                                      "Daftar",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),
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
