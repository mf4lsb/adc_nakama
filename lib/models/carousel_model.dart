// To parse this JSON data, do
//
//     final carouselModel = carouselModelFromJson(jsonString);

import 'dart:convert';

CarouselModel carouselModelFromJson(String str) => CarouselModel.fromJson(json.decode(str));

String carouselModelToJson(CarouselModel data) => json.encode(data.toJson());

class CarouselModel {
    CarouselModel({
        this.data,
    });

    List<Datum> data;

    factory CarouselModel.fromJson(Map<String, dynamic> json) => CarouselModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.judul,
        this.deskripsi,
        this.photo,
    });

    String judul;
    String deskripsi;
    String photo;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "judul": judul,
        "deskripsi": deskripsi,
        "photo": photo,
    };
}
