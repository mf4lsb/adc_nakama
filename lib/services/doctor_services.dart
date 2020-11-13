import 'package:adc_nakama/models/dokter_model.dart';
import 'package:flutter/cupertino.dart';

class DoctorServices {

  static Future<List<Datum>> getDoctor(context) async {
    final List<Datum> result = await DefaultAssetBundle.of(context).loadString("assets/dokter.json").then((value) {
      return dokterModelFromJson(value).data;
    });
    // print("Data: $data");
    // final jsonResponse = json.decode(data);
    // print("Response: $jsonResponse");

    // final DokterModel result = dokterModelFromJson(data);
    return result;
  }

}