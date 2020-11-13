import 'package:adc_nakama/models/carousel_model.dart';
import 'package:flutter/cupertino.dart';

class CarouselServices {

  static Future<List<Datum>> getCarousel(context) async {
    final List<Datum> result = await DefaultAssetBundle.of(context).loadString("assets/carousel.json").then((value) {
      return carouselModelFromJson(value).data;
    });
    // print(result);

    return result;
  }

}