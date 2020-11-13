// To parse this JSON data, do
//
//     final eventPromoModel = eventPromoModelFromJson(jsonString);

import 'dart:convert';

EventPromoModel eventPromoModelFromJson(String str) => EventPromoModel.fromJson(json.decode(str));

String eventPromoModelToJson(EventPromoModel data) => json.encode(data.toJson());

class EventPromoModel {
    EventPromoModel({
        this.data,
    });

    List<Datum> data;

    factory EventPromoModel.fromJson(Map<String, dynamic> json) => EventPromoModel(
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
        this.phoneCompany,
        this.judul,
        this.address,
        this.deskripsi,
        this.registered,
        this.keterangan,
    });

    String id;
    String picture;
    String phoneCompany;
    String judul;
    String address;
    String deskripsi;
    String registered;
    String keterangan;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        picture: json["picture"],
        phoneCompany: json["phone_company"],
        judul: json["judul"],
        address: json["address"],
        deskripsi: json["deskripsi"],
        registered: json["registered"],
        keterangan: json["keterangan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "phone_company": phoneCompany,
        "judul": judul,
        "address": address,
        "deskripsi": deskripsi,
        "registered": registered,
        "keterangan": keterangan,
    };
}
