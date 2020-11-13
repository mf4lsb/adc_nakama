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
                    Text(keterangan + " Detail",
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
                Center(child: Text("Foto ${_keteranganFoto()}", style: GoogleFonts.poppins(color: textSubTitleCard2, fontSize: 10),)),
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
                        _title(),
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
                        _tanggal(),
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            letterSpacing: 0.24,
                            //fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(_deskripsi()),
                      SizedBox(height: 180)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  String _keteranganFoto() {
    if (keterangan == "Fasilitas"){
      return keterangan + " - " + data.tempatKerja;
    }
    else if(keterangan == "Event" || keterangan == "Promo"){
      return keterangan + " - " + data.keterangan;
    }
    else if(keterangan == "Partner"){
      return keterangan + " - " + data.company;
    }
    else if(keterangan == "Berita"){
      return keterangan + " - " + "Nakama Company";
    }
    else {
      return "Default Keterangan";
    }
  }

  String _title(){
    if (keterangan == "Fasilitas"){
      return data.namaTempat;
    }
    else if(keterangan == "Event" || keterangan == "Promo"){
      return data.judul;
    }
    else if(keterangan == "Partner"){
      return data.company;
    }
    else if(keterangan == "Berita"){
      return data.judul;
    }
    else {
      return "Default Judul";
    }
  }

  String _tanggal() {
    if (keterangan == "Fasilitas"){
      return data.tanggalPublish;
    }
    else if(keterangan == "Event" || keterangan == "Promo"){
      return data.registered;
    }
    else if(keterangan == "Partner"){
      return data.tanggalPublish;
    } 
    else if(keterangan == "Berita"){
      return data.registered;
    }
    else{
      return "00000 Default Tanggal";
    }
  }
  
  String _deskripsi() {
    if (keterangan == "Fasilitas"){
      return data.keteranganTempat;
    }
    else if(keterangan == "Event" || keterangan == "Promo"){
      return data.deskripsi;
    }
    else if(keterangan == "Partner"){
      return data.deskripsi;
    } 
    else if(keterangan == "Berita"){
      return data.deskripsi;
    }
    else {
      return "Default Deskripsi";
    }
  }
}
