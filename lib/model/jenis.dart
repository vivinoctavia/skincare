import 'dart:convert';

DataJenis dataJenisFromJson(String str) => DataJenis.fromJson(json.decode(str));

String dataJenisToJson(DataJenis data) => json.encode(data.toJson());

class DataJenis {
    final String gambar;
    final String jenis;
    final String ket;

    DataJenis({
        required this.gambar,
        required this.jenis,
        required this.ket,
    });

    factory DataJenis.fromJson(Map<String, dynamic> json) => DataJenis(
        gambar: json["gambar"],
        jenis: json["jenis"],
        ket: json["ket"],
    );

    Map<String, dynamic> toJson() => {
        "gambar": gambar,
        "jenis": jenis,
        "ket": ket,
    };
}

// var produkList = [
//   ProductContainer(
//       gambar: 'assets/image/lip.png', jenis: 'Lipstik', ket: 'New'),
//   ProductContainer(
//       gambar: 'assets/image/eye2.png', Jenis: 'Eyeliner', ket: 'New'),
//   ProductContainer(
//       gambar: 'assets/image/foun1.jpg', produk: 'Foundation', ket: 'New'),
//   ProductContainer(
//       gambar: 'assets/image/con1.jpg', produk: 'Concealer', ket: 'New'),
//   ProductContainer(
//       gambar: 'assets/image/masca.png', produk: 'Mascara', ket: 'New'),
//   ProductContainer(
//       gambar: 'assets/image/p2.jpg', produk: 'Powder', ket: 'New'),
//   ProductContainer(
//       gambar: 'assets/image/e1.jpg', produk: 'Blush On', ket: 'New'),
//   ProductContainer(
//       gambar: 'assets/image/shadow1.jpg', produk: 'Eyeshadow', ket: 'New'),
//   ProductContainer(
//       gambar: 'assets/image/n1.jpg', produk: 'Nail Polish', ket: 'New'),
//   ProductContainer(
//       gambar: 'assets/image/eye5.jpg', produk: 'Eyebrow', ket: 'NEw'),
// ];
