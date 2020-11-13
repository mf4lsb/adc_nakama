import 'package:adc_nakama/models/berita_model.dart';
import 'package:flutter/cupertino.dart';

class BeritaServices {

  static Future<List<Datum>> getBerita(context) async {
    final List<Datum> result = await DefaultAssetBundle.of(context).loadString("assets/berita.json").then((value) {
      return beritaModelFromJson(value).data;
    });
    // print(result);

    return result;
  }

}