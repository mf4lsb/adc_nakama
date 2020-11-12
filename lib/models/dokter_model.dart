// To parse this JSON data, do
//
//     final dokterModel = dokterModelFromJson(jsonString);

import 'dart:convert';

DokterModel dokterModelFromJson(String str) => DokterModel.fromJson(json.decode(str));

String dokterModelToJson(DokterModel data) => json.encode(data.toJson());

class DokterModel {
    DokterModel({
        this.data,
    });

    List<Datum> data;

    factory DokterModel.fromJson(Map<String, dynamic> json) => DokterModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.isActive,
        this.picture,
        this.age,
        this.name,
        this.company,
        this.tempatKerja,
        this.email,
        this.phone,
        this.address,
        this.biografi,
        this.kredensial,
        this.afliansiAkademik,
        this.registered,
        this.workingAs,
        this.jadwalHari,
        this.jadwalJam,
        this.gender,
    });

    String id;
    bool isActive;
    String picture;
    int age;
    Name name;
    Company company;
    TempatKerja tempatKerja;
    String email;
    String phone;
    String address;
    String biografi;
    String kredensial;
    String afliansiAkademik;
    String registered;
    String workingAs;
    JadwalHari jadwalHari;
    JadwalJam jadwalJam;
    Gender gender;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        isActive: json["isActive"],
        picture: json["picture"],
        age: json["age"],
        name: Name.fromJson(json["name"]),
        company: companyValues.map[json["company"]],
        tempatKerja: tempatKerjaValues.map[json["tempat_kerja"]],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        biografi: json["biografi"],
        kredensial: json["kredensial"],
        afliansiAkademik: json["afliansi_akademik"],
        registered: json["registered"],
        workingAs: json["working_as"],
        jadwalHari: JadwalHari.fromJson(json["jadwal_hari"]),
        jadwalJam: JadwalJam.fromJson(json["jadwal_jam"]),
        gender: genderValues.map[json["gender"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "picture": picture,
        "age": age,
        "name": name.toJson(),
        "company": companyValues.reverse[company],
        "tempat_kerja": tempatKerjaValues.reverse[tempatKerja],
        "email": email,
        "phone": phone,
        "address": address,
        "biografi": biografi,
        "kredensial": kredensial,
        "afliansi_akademik": afliansiAkademik,
        "registered": registered,
        "working_as": workingAs,
        "jadwal_hari": jadwalHari.toJson(),
        "jadwal_jam": jadwalJam.toJson(),
        "gender": genderValues.reverse[gender],
    };
}

enum Company { NAKAMA }

final companyValues = EnumValues({
    "NAKAMA": Company.NAKAMA
});

enum Gender { LAKI_LAKI, PEREMPUAN }

final genderValues = EnumValues({
    "Laki-Laki": Gender.LAKI_LAKI,
    "Perempuan": Gender.PEREMPUAN
});

class JadwalHari {
    JadwalHari({
        this.hariSatu,
        this.hariDua,
        this.hariTiga,
    });

    String hariSatu;
    String hariDua;
    String hariTiga;

    factory JadwalHari.fromJson(Map<String, dynamic> json) => JadwalHari(
        hariSatu: json["hari_satu"],
        hariDua: json["hari_dua"],
        hariTiga: json["hari_tiga"],
    );

    Map<String, dynamic> toJson() => {
        "hari_satu": hariSatu,
        "hari_dua": hariDua,
        "hari_tiga": hariTiga,
    };
}

class JadwalJam {
    JadwalJam({
        this.shiftSatu,
        this.shiftDua,
        this.shiftTiga,
    });

    String shiftSatu;
    String shiftDua;
    String shiftTiga;

    factory JadwalJam.fromJson(Map<String, dynamic> json) => JadwalJam(
        shiftSatu: json["shift_satu"],
        shiftDua: json["shift_dua"],
        shiftTiga: json["shift_tiga"],
    );

    Map<String, dynamic> toJson() => {
        "shift_satu": shiftSatu,
        "shift_dua": shiftDua,
        "shift_tiga": shiftTiga,
    };
}

class Name {
    Name({
        this.first,
        this.last,
    });

    String first;
    String last;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        first: json["first"],
        last: json["last"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
    };
}

enum TempatKerja { KLINIK_NAKAMA, RS_NAKAMA }

final tempatKerjaValues = EnumValues({
    "KLINIK NAKAMA": TempatKerja.KLINIK_NAKAMA,
    "RS NAKAMA": TempatKerja.RS_NAKAMA
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
