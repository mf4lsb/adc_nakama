import 'package:adc_nakama/models/lowongan_model.dart';
import 'package:flutter/cupertino.dart';

class LowonganServices {

  static Future<List<Datum>> getLowongan(context) async {
    final List<Datum> result = await DefaultAssetBundle.of(context).loadString("assets/lowongan.json").then((value) {
      return lowonganModelFromJson(value).data;
    });

    return result;
  }

}