// To parse this JSON data, do
//
//     final layananFasilitasModel = layananFasilitasModelFromJson(jsonString);

import 'dart:convert';

LayananFasilitasModel layananFasilitasModelFromJson(String str) => LayananFasilitasModel.fromJson(json.decode(str));

String layananFasilitasModelToJson(LayananFasilitasModel data) => json.encode(data.toJson());

class LayananFasilitasModel {
    LayananFasilitasModel({
        this.data,
    });

    List<Datum> data;

    factory LayananFasilitasModel.fromJson(Map<String, dynamic> json) => LayananFasilitasModel(
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
        this.namaTempat,
        this.tempatKerja,
        this.keteranganTempat,
        this.tanggalPublish,
    });

    String id;
    String picture;
    String namaTempat;
    String tempatKerja;
    String keteranganTempat;
    String tanggalPublish;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        picture: json["picture"],
        namaTempat: json["nama_tempat"],
        tempatKerja: json["tempat_kerja"],
        keteranganTempat: json["keterangan_tempat"],
        tanggalPublish: json["tanggal_publish"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "nama_tempat": namaTempat,
        "tempat_kerja": tempatKerja,
        "keterangan_tempat": keteranganTempat,
        "tanggal_publish": tanggalPublish,
    };
}
