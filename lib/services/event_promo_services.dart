import 'package:adc_nakama/models/event_promo_model.dart';
import 'package:flutter/cupertino.dart';

class EventPromoServices {

  static Future<List<Datum>> getFasilitas(context) async {
    final List<Datum> result = await DefaultAssetBundle.of(context).loadString("assets/event_promo.json").then((value) {
      return eventPromoModelFromJson(value).data;
    });

    return result;
  }

}