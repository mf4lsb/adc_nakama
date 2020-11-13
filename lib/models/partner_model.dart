// To parse this JSON data, do
//
//     final partnerModel = partnerModelFromJson(jsonString);

import 'dart:convert';

PartnerModel partnerModelFromJson(String str) => PartnerModel.fromJson(json.decode(str));

String partnerModelToJson(PartnerModel data) => json.encode(data.toJson());

class PartnerModel {
    PartnerModel({
        this.data,
    });

    List<Datum> data;

    factory PartnerModel.fromJson(Map<String, dynamic> json) => PartnerModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.picture,
        this.company,
        this.deskripsi,
        this.tanggalPublish,
    });

    String id;
    String picture;
    String company;
    String deskripsi;
    String tanggalPublish;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        picture: json["picture"],
        company: json["company"],
        deskripsi: json["deskripsi"],
        tanggalPublish: json["tanggal_publish"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "company": company,
        "deskripsi": deskripsi,
        "tanggal_publish": tanggalPublish,
    };
}
