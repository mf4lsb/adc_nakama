import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adc_nakama/color_palette.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'detail_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final TextStyle textStyle = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w600, color: textTitleCard2);

  TabController _tabController;
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blueTitleDoktor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(left: 15, top: 16),
            child: Text(
              "Profile",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: blueTitleDoktor,
            ),
            Positioned(
              top: 84,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 66,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Irfan Trianto",
                          style: textStyle,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Laki - Laki",
                          style: textStyle.copyWith(
                              color: textSubTitleCard2, fontSize: 12),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "0895351577557",
                          style: textStyle.copyWith(
                              color: textSubTitleCard1, fontSize: 12),
                        ),
                      ],
                    ),
                    Container(
                      height: 45,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: greyButtonDoktor,
                      ),
                      child: Row(children: [
                        Expanded(
                          flex: 5,
                          child: ButtonTheme(
                            height: 40,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            child: FlatButton(
                              color: _getBackgroundColor(0),
                              onPressed: () {
                                setState(() {
                                  _tabController.animateTo(0);
                                  _currentIndex = 0;
                                });
                              },
                              child: Text("Notifikasi"),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: ButtonTheme(
                            height: 40,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            child: FlatButton(
                              color: _getBackgroundColor(1),
                              onPressed: () {
                                setState(() {
                                  _tabController.animateTo(1);
                                  _currentIndex = 1;
                                });
                              },
                              child: Text("History Booking"),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Flexible(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          //* Notifikasi
                          ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DetailScreen())),
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: blueTitleDoktor
                                                  .withOpacity(0.1)),
                                          width: 48,
                                          height: 48,
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Waktunya Kontrol Nih",
                                                style: textStyle,
                                              ),
                                              Text(
                                                "Ingat Jadwal kontrol rutin mingguan anda dengan dr. Sandy Sucipto hari selasa",
                                                style: textStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xFF3C4249),
                                                    fontSize: 12),
                                                overflow: TextOverflow.fade,
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "2 jam yang lalu",
                                                    style: textStyle.copyWith(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xFFA6A6A6),
                                                        fontSize: 13),
                                                  ),
                                                  Chip(
                                                    label: Text(
                                                      "New",
                                                      style: textStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    ),
                                                    backgroundColor:
                                                        chipOrange2,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              );
                            },
                          ),

                          //* History Booking
                          FutureBuilder(
                              future: _getHistoryBooking(),
                              builder: (context, snapshot) {
                                dynamic data = snapshot.data;
                                return (snapshot.hasData)
                                    ? (snapshot.data != null)
                                        ? ListView.builder(
                                            itemCount: data.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 12),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            color:
                                                                blueTitleDoktor
                                                                    .withOpacity(
                                                                        0.1)),
                                                        width: 48,
                                                        height: 48,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                data[index][2],
                                                            fit: BoxFit.cover,
                                                            placeholder: (BuildContext
                                                                        context,
                                                                    String
                                                                        url) =>
                                                                Center(
                                                                    child:
                                                                        SpinKitFadingCircle(
                                                              color:
                                                                  Colors.blue,
                                                            )),
                                                            errorWidget:
                                                                (BuildContext
                                                                        context,
                                                                    String url,
                                                                    dynamic
                                                                        error) {
                                                              print(error);
                                                              return Icon(Icons
                                                                  .error_outline);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 12,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "${data[index][0]}",
                                                                style:
                                                                    textStyle),
                                                            Text(
                                                              "${data[index][1]}",
                                                              style: textStyle.copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Color(
                                                                      0xFF3C4249),
                                                                  fontSize: 12),
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                            ),
                                                            SizedBox(
                                                              height: 6,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "${DateFormat.yMMMEd().format(DateTime.parse(data[index][3]))}",
                                                                  style: textStyle.copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      color: Color(
                                                                          0xFFA6A6A6),
                                                                      fontSize:
                                                                          13),
                                                                ),
                                                                Chip(
                                                                    backgroundColor:
                                                                        (_differenceTime(data[index][3]) == "Selesai") ? Color(0xFF6FCF97) : chipOrange,
                                                                    label: Text(
                                                                      _differenceTime(
                                                                          data[index]
                                                                              [
                                                                              3]),
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              Colors.white),
                                                                    )),
                                                                // child: Text("2 Hari Lagi"))
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ));
                                            },
                                          )
                                        : Center(
                                            child: Text(
                                                "Belum ada riwayat pemesanan, silahkan pesan layanan dokter",
                                                textAlign: TextAlign.center))
                                    : Center(
                                        child: SpinKitFadingCircle(
                                        color: Colors.blue,
                                      ));
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 34,
              left: 130,
              right: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://images.unsplash.com/photo-1574168849546-427632ef799e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: 20,
              child: SvgPicture.asset(
                "assets/icons/more-horizontal.svg",
                width: 24,
                height: 24,
                fit: BoxFit.cover,
              ),
            )
          ],
        ));
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      return Colors.white;
    } else {
      return greyButtonDoktor;
    }
  }

  Future<List<List<String>>> _getHistoryBooking() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> listDokter = prefs.getStringList('listDokter');
    List<String> listSpesialis = prefs.getStringList('listSpesialis');
    List<String> listFoto = prefs.getStringList('listFoto');
    List<String> listDate = prefs.getStringList('listDate');
    List<List<String>> result = [];

    for (var i = 0; i < listDokter.length; i++) {
      result.add([listDokter[i], listSpesialis[i], listFoto[i], listDate[i]]);
    }

    return result;
  }

  String _differenceTime(time) {
    var parsedDate = DateTime.parse(time);
    int result = parsedDate.difference(DateTime.now()).inDays;

    if (result < 0) {
      return "Selesai";
    } else if (result > 0) {
      return "$result Hari Lagi";
    } else {
      return "Hari ini";
    }
  }
}

// ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.network(
//             'https://images.unsplash.com/photo-1574168849546-427632ef799e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
//             fit: BoxFit.cover,
//             width: 100,
//             height: 100,
//               ),
//             ))
