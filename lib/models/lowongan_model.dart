// To parse this JSON data, do
//
//     final lowonganModel = lowonganModelFromJson(jsonString);

import 'dart:convert';

LowonganModel lowonganModelFromJson(String str) => LowonganModel.fromJson(json.decode(str));

String lowonganModelToJson(LowonganModel data) => json.encode(data.toJson());

class LowonganModel {
    LowonganModel({
        this.data,
    });

    List<Datum> data;

    factory LowonganModel.fromJson(Map<String, dynamic> json) => LowonganModel(
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
        this.namaLowongan,
        this.recruitment,
        this.phoneCompany,
        this.address,
        this.deskripsi,
        this.registered,
    });

    String id;
    String picture;
    String namaLowongan;
    String recruitment;
    String phoneCompany;
    String address;
    String deskripsi;
    String registered;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        picture: json["picture"],
        namaLowongan: json["nama_lowongan"],
        recruitment: json["recruitment"],
        phoneCompany: json["phone_company"],
        address: json["address"],
        deskripsi: json["deskripsi"],
        registered: json["registered"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "nama_lowongan": namaLowongan,
        "recruitment": recruitment,
        "phone_company": phoneCompany,
        "address": address,
        "deskripsi": deskripsi,
        "registered": registered,
    };
}
