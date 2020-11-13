import 'package:adc_nakama/models/carousel_model.dart';
import 'package:flutter/cupertino.dart';

class CarouselServices {

  static Future<List<String>> getCarousel(context) async {
    final List<String> result = await DefaultAssetBundle.of(context).loadString("assets/carousel.json").then((value) {
      return carouselModelFromJson(value).data;
    });

    return result;
  }

}