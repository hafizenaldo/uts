// To parse this JSON data, do
//
//     final modelBeritaApi = modelBeritaApiFromJson(jsonString);

import 'dart:convert';

ModelBeritaApi modelBeritaApiFromJson(String str) => ModelBeritaApi.fromJson(json.decode(str));

String modelBeritaApiToJson(ModelBeritaApi data) => json.encode(data.toJson());

class ModelBeritaApi {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelBeritaApi({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelBeritaApi.fromJson(Map<String, dynamic> json) => ModelBeritaApi(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String idBerita;
  String judul;
  String konten;
  String gambar;
  String author;
  DateTime created;
  dynamic updated;

  Datum({
    required this.idBerita,
    required this.judul,
    required this.konten,
    required this.gambar,
    required this.author,
    required this.created,
    required this.updated,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idBerita: json["id_berita"],
    judul: json["judul"],
    konten: json["konten"],
    gambar: json["gambar"],
    author: json["author"],
    created: DateTime.parse(json["created"]),
    updated: json["updated"],
  );

  Map<String, dynamic> toJson() => {
    "id_berita": idBerita,
    "judul": judul,
    "konten": konten,
    "gambar": gambar,
    "author": author,
    "created": created.toIso8601String(),
    "updated": updated,
  };
}
