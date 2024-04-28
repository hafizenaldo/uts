// To parse this JSON data, do
//
//     final modelRegisterApi = modelRegisterApiFromJson(jsonString);

import 'dart:convert';

ModelRegisterApi modelRegisterApiFromJson(String str) => ModelRegisterApi.fromJson(json.decode(str));

String modelRegisterApiToJson(ModelRegisterApi data) => json.encode(data.toJson());

class ModelRegisterApi {
  int value;
  String username;
  String email;
  String nama;
  String nobp;
  String nohp;
  String alamat;
  String message;

  ModelRegisterApi({
    required this.value,
    required this.username,
    required this.email,
    required this.nama,
    required this.nobp,
    required this.nohp,
    required this.alamat,
    required this.message,
  });

  factory ModelRegisterApi.fromJson(Map<String, dynamic> json) => ModelRegisterApi(
    value: json["value"],
    username: json["username"],
    email: json["email"],
    nama: json["nama"],
    nobp: json["nobp"],
    nohp: json["nohp"],
    alamat: json["alamat"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "username": username,
    "email": email,
    "nama": nama,
    "nobp": nobp,
    "nohp": nohp,
    "alamat": alamat,
    "message": message,
  };
}
