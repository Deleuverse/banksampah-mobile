// To parse this JSON data, do
//
//     final pengumumanResponse = pengumumanResponseFromJson(jsonString);

import 'dart:convert';

PengumumanResponse pengumumanResponseFromJson(String str) => PengumumanResponse.fromJson(json.decode(str));

String pengumumanResponseToJson(PengumumanResponse data) => json.encode(data.toJson());

class PengumumanResponse {
  bool status;
  String message;
  List<Notif> data;

  PengumumanResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PengumumanResponse.fromJson(Map<String, dynamic> json) => PengumumanResponse(
    status: json["status"],
    message: json["message"],
    data: List<Notif>.from(json["data"].map((x) => Notif.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Notif {
  int idPengumuman;
  String judul;
  String isi;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Notif({
    required this.idPengumuman,
    required this.judul,
    required this.isi,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notif.fromJson(Map<String, dynamic> json) => Notif(
    idPengumuman: json["id_pengumuman"],
    judul: json["judul"],
    isi: json["isi"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_pengumuman": idPengumuman,
    "judul": judul,
    "isi": isi,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
