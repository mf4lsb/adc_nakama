import 'package:adc_nakama/services/doctor_services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adc_nakama/color_palette.dart';
import 'package:adc_nakama/screens/doktor_screen.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, top: 24),
                child: Text("Booking",
                    style: GoogleFonts.poppins(
                      color: textTitleCard2,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    )),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: FutureBuilder(
              future: DoctorServices.getDoctor(context),
              builder: (context, snapshot) {
                dynamic data = snapshot.data.data;
                return (snapshot.hasData)
                ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DoktorScreen(
                                    dokter: data[index],
                                  ))),
                      child: ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: Hero(
                            tag: data[index].picture,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                imageUrl: data[index].picture,
                                fit: BoxFit.cover,
                                placeholder:
                                    (BuildContext context, String url) =>
                                        Center(
                                            child: SpinKitFadingCircle(
                                  color: Colors.blue,
                                )),
                                errorWidget: (BuildContext context, String url,
                                    dynamic error) {
                                  print(error);
                                  return Icon(Icons.error_outline);
                                },
                              ),
                            ),
                          ),
                        ),
                        title: Text("Dokter ${index + 1}",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: titleList)),
                        subtitle: Text(
                          "Umum",
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              color: subtitleList),
                        ),
                      ),
                    );
                  },
                )
                : SpinKitFadingCircle(color: Colors.blue,);
              }),
        ));
  }
}
