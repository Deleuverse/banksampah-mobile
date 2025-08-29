
import 'dart:convert';

UserResponse userDetailResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userDetailResponseToJson(UserResponse data) =>
    json.encode(data.toJson());

class UserResponse {
  final int idRegistrasi;
  final String namaLengkap;
  final String alamat;
  final String nomerTelepon;
  final String nomerIndukNasabah;
  final String? tanggal;
  final double? saldo;
  final String foto;



  UserResponse({
    required this.idRegistrasi,
    required this.namaLengkap,
    required this.alamat,
    required this.nomerTelepon,
    required this.nomerIndukNasabah,
    this.tanggal,
    this.saldo,
    required this.foto,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      idRegistrasi: json['id_registrasi'] ?? '',
      namaLengkap: json['nama_lengkap'] ?? '',
      alamat: json['alamat'] ?? '',
      nomerTelepon: json['nomer_telepon'] ?? '',
      nomerIndukNasabah: json['nomer_induk_nasabah'] ?? '',
      tanggal: json['tanggal'] != null ? json['tanggal'] : null,
      saldo: json['saldo'] != null ? double.tryParse(json['saldo'].toString()) : null,
      foto: json['foto'] ?? '',
    );
  }


  Map<String, dynamic> toJson() => {
    'id_registrasi': idRegistrasi,
    'nama_lengkap': namaLengkap,
    'alamat': alamat,
    'nomer_telepon': nomerTelepon,
    'nomer_induk_nasabah': nomerIndukNasabah,
    'tanggal': tanggal,
    'saldo': saldo,
    'foto': foto,
  };
}