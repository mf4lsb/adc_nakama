import 'package:adc_nakama/models/dokter_model.dart';
import 'package:flutter/cupertino.dart';

class DoctorServices {

  static Future<DokterModel> getDoctor(context) async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/dokter.json");
    // print("Data: $data");
    // final jsonResponse = json.decode(data);
    // print("Response: $jsonResponse");

    final DokterModel result = dokterModelFromJson(data);
    return result;
  }

}