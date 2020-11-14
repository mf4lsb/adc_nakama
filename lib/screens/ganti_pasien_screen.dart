import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../color_palette.dart';

// enum SingingCharacter { pria, wanita, none }

class GantiPasien extends StatefulWidget {

  final int id;
  GantiPasien({Key key, this.id = 0}) : super(key: key);

  @override
  _GantiPasienState createState() => _GantiPasienState();
}

class _GantiPasienState extends State<GantiPasien> {
  final TextStyle textStyle = GoogleFonts.poppins(
      color: textTitleCard2, fontSize: 18, fontWeight: FontWeight.w600);

  int id = 0;

  int _selectedRadioIndex;

  String _selectedDropdownValue = "";

  bool _btnEnabled = false;
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  String _character = "none";
  String _valStatus;

  List _status = ["Tetangga", "Anak", "Istri", "Keluarga"];

  @override
  void initState() {
    super.initState();
    setState(() {
      _loading = false;
      id = widget.id;
    });
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  Future<List<List<String>>> getPasien() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> listNama = prefs.getStringList("nama");
    List<String> listGender = prefs.getStringList("gender");
    List<String> listStatus = prefs.getStringList("status");
    List<List<String>> result = [];

    for (var i = 0; i < listNama.length; i++) {
      result.add([listNama[i], listGender[i], listStatus[i]]);
    }

    return result;
  }

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
          FutureBuilder(
              future: getPasien(),
              builder: (context, snapshot) {
                dynamic data = snapshot.data;
                return (snapshot.hasData)
                    ? (snapshot.data != null)
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal: BorderSide(
                                            color: Color(0xFFF0F0F0)))),
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 19),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nama: ${data[index][0]}",
                                          style: textStyle.copyWith(
                                              color: Color(0xFF8B8B8B),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.24),
                                        ),
                                        Text("Jenis Kelamin: ${data[index][1]}",
                                            style: textStyle.copyWith(
                                                color: Color(0xFF8B8B8B),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.24)),
                                        Text("Status: ${data[index][2]}",
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
                                      onChanged: (val) async {
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        prefs.remove('pasienAktif');
                                        prefs.setInt("pasienAktif", index);
                                        setState(() {
                                          id = index;
                                          _selectedRadioIndex = val;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              );
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
                          onChanged: () => mystate(() =>
                              _btnEnabled = _formKey.currentState.validate()),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                // height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                  controller: nameController,
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
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      hintStyle: GoogleFonts.poppins(
                                        color: subtitleList,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.blue))),
                                ),
                              ),
                              SizedBox(
                                height: 5,
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
                                      value: "Laki Laki",
                                      groupValue: _character,
                                      onChanged: (String value) {
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
                                        color: (_character != "Laki Laki")
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
                                    groupValue: _character,
                                    onChanged: (String value) {
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
                                        color: (_character != "Perempuan")
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
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: DropdownButton(
                                  hint: Text(
                                    "Pilih salah satu",
                                    style: GoogleFonts.poppins(
                                        color: Color(0xFFB8BCC6), fontSize: 12),
                                  ),
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
                                      _selectedDropdownValue = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 27,
                              ),
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
                                        onPressed: (_btnEnabled == false ||
                                                _character == "none" ||
                                                _selectedDropdownValue == "")
                                            ? null
                                            : () async {
                                                setState(() {
                                                  _loading = true;
                                                });
                                                SharedPreferences prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                List<String> listNama =
                                                    prefs.getStringList('nama');
                                                List<String> listGender = prefs
                                                    .getStringList('gender');
                                                List<String> listStatus = prefs
                                                    .getStringList('status');

                                                listNama
                                                    .add(nameController.text);
                                                listGender.add(_character);
                                                listStatus.add(
                                                    _selectedDropdownValue);

                                                prefs.remove("nama");
                                                prefs.remove("gender");
                                                prefs.remove("status");

                                                prefs.setStringList(
                                                    "nama", listNama);
                                                prefs.setStringList(
                                                    "gender", listGender);
                                                prefs.setStringList(
                                                    "status", listStatus);

                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            GantiPasien()));
                                              },
                                        color: blueTitleDoktor,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: (_loading == false)
                                            ? Text(
                                                "Daftar",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              )
                                            : SpinKitFadingCircle(
                                                color: Colors.blue)),
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
