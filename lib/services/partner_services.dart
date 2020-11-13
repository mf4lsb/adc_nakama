import 'package:adc_nakama/models/partner_model.dart';
import 'package:flutter/cupertino.dart';

class PartnerServices {

  static Future<List<Datum>> getPartner(context) async {
    final List<Datum> result = await DefaultAssetBundle.of(context).loadString("assets/partner.json").then((value) {
      return partnerModelFromJson(value).data;
    });

    return result;
  }

}