import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adc_nakama/color_palette.dart';

class MultiPurposeScreen extends StatelessWidget {
  final dynamic data;
  final String keterangan;
  MultiPurposeScreen({Key key, this.data, this.keterangan}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, top: 24),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                    Text(keterangan,
                        style: GoogleFonts.poppins(
                          color: textTitleCard2,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: data.id,
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[300],
                    child: CachedNetworkImage(
                      imageUrl: data.picture,
                      width: 150,
                      height: 180,
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
                SizedBox(height: 8,),
                Center(child: Text("Foto $keterangan - ${data.tempatKerja}", style: GoogleFonts.poppins(color: textSubTitleCard2, fontSize: 10),)),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        keterangan,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            letterSpacing: 0.24,
                            fontWeight: FontWeight.w600,
                            color: blueTitleDoktor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        data.namaTempat,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            letterSpacing: 0.24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        data.tanggalPublish,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            letterSpacing: 0.24,
                            //fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(data.keteranganTempat),
                      SizedBox(height: 180)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
