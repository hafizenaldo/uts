import 'package:flutter/material.dart';

import '../model/model_berita.dart';
// Pastikan path ini sesuai dengan lokasi ModelBerita Anda

class DetailBeritaPage extends StatelessWidget {
  final Datum? berita; // Menggunakan tipe Datum dari ModelBerita

  const DetailBeritaPage(this.berita, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(berita?.judul ?? "Detail Berita"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 4, right:
            4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'http://172.20.10.6/uts_mobile/image/${berita!.gambar}',
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            title: Text(
              berita?.judul ?? "",
              style: const TextStyle(fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            trailing: const Icon(
              Icons.star,
              color: Colors.red,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16, bottom: 16,
                left: 16),
            child: Text(
              berita?.konten ?? "",
              style: const TextStyle(fontSize: 14, fontWeight:
              FontWeight.w400),
              textAlign: TextAlign.justify,
            ),
          ),
          Text(
            berita?.created.toString() ?? "" ,
            style: const TextStyle(fontSize: 14, fontWeight:
            FontWeight.w400),
            textAlign: TextAlign.justify,
          ),
          Text(
            berita?.author ?? "",
            style: const TextStyle(fontSize: 14, fontWeight:
            FontWeight.bold),
            textAlign: TextAlign.right,
          )
        ],
      ),
    );
  }
}
