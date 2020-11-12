import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_palette.dart';

enum SingingCharacter { pria, wanita, none }

class GantiPasien extends StatefulWidget {
  @override
  _GantiPasienState createState() => _GantiPasienState();
}

class _GantiPasienState extends State<GantiPasien> {
  final TextStyle textStyle = GoogleFonts.poppins(
      color: textTitleCard2, fontSize: 18, fontWeight: FontWeight.w600);

  int id = 1;

  int _selectedRadioIndex;

  final _formKey = GlobalKey<FormState>();

  SingingCharacter _character = SingingCharacter.none;
  String _valStatus;

  List _status = ["Saya Sendiri", "Anak"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ganti Pasien",
          style: textStyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: textTitleCard2),
      ),
      body: ListView(
        children: [
          SizedBox(height: 1),
          ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(color: Color(0xFFF0F0F0)))),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama: Irfan Trianto",
                            style: textStyle.copyWith(
                                color: Color(0xFF8B8B8B),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.24),
                          ),
                          Text("Jenis Kelamin: Laki-Laki",
                              style: textStyle.copyWith(
                                  color: Color(0xFF8B8B8B),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.24)),
                          Text("Status: Saya Sendiri",
                              style: textStyle.copyWith(
                                  color: Color(0xFF8B8B8B),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.24)),
                        ],
                      ),
                      Radio(
                        value: index,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            id = index;
                            _selectedRadioIndex = val;
                          });
                        },
                      )
                    ],
                  ),
                );
              }),
          SizedBox(height: 12),
          Center(
              child: InkWell(
                  onTap: () => _settingModalBottomSheet(),
                  child: Text(
                    "Tambah Baru",
                    style: textStyle.copyWith(
                        color: blueTitleDoktor,
                        fontSize: 12,
                        letterSpacing: 0.24),
                  ))),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  void _settingModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter mystate) {
            return AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: FractionallySizedBox(
                heightFactor: 0.7,
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
                          "Tambah info pasien baru",
                          style: textStyle.copyWith(
                            color: blueTitleDoktor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nama*",
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
                                height: 10,
                              ),
                              Text(
                                "Jenis Kelamin*",
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
                                      groupValue: _character,
                                      onChanged: (SingingCharacter value) {
                                        mystate(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    "Laki Laki",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: (_character !=
                                                SingingCharacter.pria)
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
                                    groupValue: _character,
                                    onChanged: (SingingCharacter value) {
                                      mystate(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Perempuan",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: (_character !=
                                                SingingCharacter.wanita)
                                            ? subtitleList
                                            : Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Status*",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: textSubTitleCard2),
                              ),
                              Container(
                                height: 60,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                                child: DropdownButton(
                                  hint: Text("Pilih salah satu"),
                                  value: _valStatus,
                                  items: _status.map((value) {
                                    return DropdownMenuItem(
                                      child: Text(value),
                                      value: value,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    mystate(() {
                                      _valStatus = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 27,),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          borderRadius:
                                              BorderRadius.circular(7)),
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
                                      onPressed: () {},
                                      color: blueTitleDoktor,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}
