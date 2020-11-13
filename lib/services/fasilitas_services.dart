import 'package:adc_nakama/models/layanan_fasilitas_model.dart';
import 'package:flutter/cupertino.dart';

class FasilitasServices {

  static Future<List<Datum>> getFasilitas(context) async {
    final List<Datum> result = await DefaultAssetBundle.of(context).loadString("assets/layanan_fasilitas.json").then((value) {
      return layananFasilitasModelFromJson(value).data;
    });

    return result;
  }

}