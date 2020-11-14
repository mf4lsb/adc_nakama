import 'package:adc_nakama/models/carousel_model.dart';
import 'package:adc_nakama/services/carousel_services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CarouselHome extends StatefulWidget {
  @override
  _CarouselHomeState createState() => _CarouselHomeState();
}

class _CarouselHomeState extends State<CarouselHome> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CarouselServices.getCarousel(context),
        builder: (context, snapshot) {
          List<Datum> listImage = snapshot.data;
          return (snapshot.hasData)
              ? (snapshot.data != null)
                  ? Stack(
                      children: [
                        Container(
                            child: CarouselSlider(
                          options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(
                                  () {
                                    _current = index;
                                  },
                                );
                              },
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              enlargeCenterPage: false,
                              viewportFraction: 1),
                          items: listImage
                              .map((item) => Container(
                                    child: CachedNetworkImage(
                                      imageUrl: item.photo,
                                      width: MediaQuery.of(context).size.width,
                                      height: 180,
                                      fit: BoxFit.cover,
                                      placeholder:
                                          (BuildContext context, String url) =>
                                              Center(
                                                  child: SpinKitFadingCircle(
                                        color: Colors.blue,
                                      )),
                                      errorWidget: (BuildContext context,
                                          String url, dynamic error) {
                                        print(error);
                                        return Icon(Icons.error_outline);
                                      },
                                    ),
                                    color: Colors.grey[300],
                                  ))
                              .toList(),
                        )),
                        Positioned(
                          left: 20,
                          bottom: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: listImage.map((url) {
                              int index = listImage.indexOf(url);
                              return (_current == index)
                                  ? Container(
                                      width: 25.0,
                                      height: 9.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: _current == index
                                            ? Colors.blue
                                            : Colors.white,
                                      ),
                                    )
                                  : Container(
                                      width: 10.0,
                                      height: 9.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _current == index
                                            ? Colors.blue
                                            : Colors.white,
                                      ),
                                    );
                            }).toList(),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: SpinKitFadingCircle(
                        color: Colors.blue,
                      ),
                    )
              : Center(
                  child: SpinKitFadingCircle(
                    color: Colors.blue,
                  ),
                );
        });
  }
}
