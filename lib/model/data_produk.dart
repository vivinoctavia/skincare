import 'package:meta/meta.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final dataProduct = dataProductFromJson(jsonString);

import 'dart:convert';

DataProduct dataProductFromJson(String str) => DataProduct.fromJson(json.decode(str));

String dataProductToJson(DataProduct data) => json.encode(data.toJson());

class DataProduct {
    final String deskripsi;
    final String gambar;
    final String harga;
    final String jenis;
    final String ket;
    final String merk;
    final String rating;

    DataProduct({
        required this.deskripsi,
        required this.gambar,
        required this.harga,
        required this.jenis,
        required this.ket,
        required this.merk,
        required this.rating,
    });

    factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
        deskripsi: json["deskripsi"],
        gambar: json["gambar"],
        harga: json["harga"],
        jenis: json["jenis"],
        ket: json["ket"],
        merk: json["merk"],
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "deskripsi": deskripsi,
        "gambar": gambar,
        "harga": harga,
        "jenis": jenis,
        "ket": ket,
        "merk": merk,
        "rating": rating,
    };
}



// var dataprodukList = [
//   //Lipstik
//   DataProduct(
//     gambar: 'assets/image/lip1.png',
//     merk: 'Hanasui LipGloss',
//     harga: 'RP.60.000',
//     jenis: 'Lipstik',
//     rating: 'Top Product',
//     deskripsi:
//         'Lipstik Matte EverGlow adalah jawaban sempurna untuk tampilan bibir yang memukau sepanjang hari. Dengan formula inovatif yang menggabungkan kelembapan dan daya tahan, lipstik ini akan menghadirkan bibir yang tampak sehat, berkilau, dan tahan lama.',
//     keunggulan: [
//       'Matte yang Halus',
//       'Tahan Lama',
//       'Warna-Warna Pilihan',
//       'Formula Nourishing',
//       'Desain Elegan'
//     ],
//   ),
  
//   DataProduct(
//     gambar: 'assets/image/lip2.jpg',
//     merk: 'Wardah',
//     harga: 'RP.60.000',
//     jenis: 'Lipstik',
//     rating: 'Top Product',
//     deskripsi:
//         'Lipstik Matte Wardah adalah jawaban sempurna untuk tampilan bibir yang memukau sepanjang hari. Dengan formula inovatif yang menggabungkan kelembapan dan daya tahan, lipstik ini akan menghadirkan bibir yang tampak sehat, berkilau, dan tahan lama.',
//     keunggulan: [
//       'Matte yang Halus',
//       'Tahan Lama',
//       'Warna-Warna Pilihan',
//       'Formula Nourishing',
//       'Desain Elegan'
//     ],
//   ),
//   DataProduct(
//     gambar: 'assets/image/lip.png',
//     merk: 'Hanasui LipGloss',
//     harga: 'RP.60.000',
//     jenis: 'Lipstik',
//     rating: 'Top Product',
//     deskripsi:
//         'Lipstik Matte EverGlow adalah jawaban sempurna untuk tampilan bibir yang memukau sepanjang hari. Dengan formula inovatif yang menggabungkan kelembapan dan daya tahan, lipstik ini akan menghadirkan bibir yang tampak sehat, berkilau, dan tahan lama.',
//     keunggulan: [
//       'Matte yang Halus',
//       'Tahan Lama',
//       'Warna-Warna Pilihan',
//       'Formula Nourishing',
//       'Desain Elegan'
//     ],
//   ),
//   DataProduct(
//     gambar: 'assets/image/lip1.png',
//     merk: 'Hanasui LipGloss',
//     harga: 'RP.60.000',
//     jenis: 'Lipstik',
//     rating: 'Top Product',
//     deskripsi:
//         'Lipstik Matte EverGlow adalah jawaban sempurna untuk tampilan bibir yang memukau sepanjang hari. Dengan formula inovatif yang menggabungkan kelembapan dan daya tahan, lipstik ini akan menghadirkan bibir yang tampak sehat, berkilau, dan tahan lama.',
//     keunggulan: [
//       'Matte yang Halus',
//       'Tahan Lama',
//       'Warna-Warna Pilihan',
//       'Formula Nourishing',
//       'Desain Elegan'
//     ],
//   ),
//   DataProduct(
//     gambar: 'assets/image/lip1.png',
//     merk: 'Hanasui LipGloss',
//     harga: 'RP.60.000',
//     jenis: 'Lipstik',
//     rating: 'Top Product',
//     deskripsi:
//         'Lipstik Matte EverGlow adalah jawaban sempurna untuk tampilan bibir yang memukau sepanjang hari. Dengan formula inovatif yang menggabungkan kelembapan dan daya tahan, lipstik ini akan menghadirkan bibir yang tampak sehat, berkilau, dan tahan lama.',
//     keunggulan: [
//       'Matte yang Halus',
//       'Tahan Lama',
//       'Warna-Warna Pilihan',
//       'Formula Nourishing',
//       'Desain Elegan'
//     ],
//   ),

