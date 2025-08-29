// To parse this JSON data, do
//
//     final sampahResponse = sampahResponseFromJson(jsonString);

import 'dart:convert';

SampahResponse sampahResponseFromJson(String str) => SampahResponse.fromJson(json.decode(str));

String sampahResponseToJson(SampahResponse data) => json.encode(data.toJson());

class SampahResponse {
  bool success;
  String message;
  List<DataSampah> data;

  SampahResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SampahResponse.fromJson(Map<String, dynamic> json) => SampahResponse(
    success: json["success"],
    message: json["message"],
    data: List<DataSampah>.from(json["data"].map((x) => DataSampah.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataSampah {
  int idSampah;
  String jenisSampah;
  int hargaPengepul;
  int hargaDitabung;
  String deskripsi;
  String foto;
  DateTime createdAt;
  DateTime updatedAt;
  String hargaPengepulRp;
  String hargaDitabungRp;
  String fotoUrl;

  DataSampah({
    required this.idSampah,
    required this.jenisSampah,
    required this.hargaPengepul,
    required this.hargaDitabung,
    required this.deskripsi,
    required this.foto,
    required this.createdAt,
    required this.updatedAt,
    required this.hargaPengepulRp,
    required this.hargaDitabungRp,
    required this.fotoUrl,
  });

  factory DataSampah.fromJson(Map<String, dynamic> json) => DataSampah(
    idSampah: json["id_sampah"],
    jenisSampah: json["jenis_sampah"],
    hargaPengepul: json["harga_pengepul"],
    hargaDitabung: json["harga_ditabung"],
    deskripsi: json["deskripsi"],
    foto: json["foto"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    hargaPengepulRp: json["harga_pengepul_rp"],
    hargaDitabungRp: json["harga_ditabung_rp"],
    fotoUrl: json["foto_url"],
  );

  Map<String, dynamic> toJson() => {
    "id_sampah": idSampah,
    "jenis_sampah": jenisSampah,
    "harga_pengepul": hargaPengepul,
    "harga_ditabung": hargaDitabung,
    "deskripsi": deskripsi,
    "foto": foto,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "harga_pengepul_rp": hargaPengepulRp,
    "harga_ditabung_rp": hargaDitabungRp,
    "foto_url": fotoUrl,
  };
}
