// To parse this JSON data, do
//
//     final beritaModel = beritaModelFromJson(jsonString);

import 'dart:convert';

BeritaModel beritaModelFromJson(String str) => BeritaModel.fromJson(json.decode(str));

String beritaModelToJson(BeritaModel data) => json.encode(data.toJson());

class BeritaModel {
    BeritaModel({
        this.data,
    });

    List<Datum> data;

    factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
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
        this.judul,
        this.deskripsi,
        this.registered,
    });

    String id;
    String picture;
    String judul;
    String deskripsi;
    String registered;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        picture: json["picture"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        registered: json["registered"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "judul": judul,
        "deskripsi": deskripsi,
        "registered": registered,
    };
}
