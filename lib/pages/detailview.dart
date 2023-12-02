import 'package:flutter/material.dart';
import 'package:skincare/pages/profile.dart';
import 'package:skincare/model/data_produk.dart';
import 'package:skincare/model/jenis.dart';

class detail extends StatelessWidget {
  const detail({Key? key, required this.detailproduk});

  final DataProduct detailproduk;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: Colors.pink[200],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                  child: Image.network(detailproduk.gambar,
                      width: 400, fit: BoxFit.fill)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 33, 20, 12),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        detailproduk.merk,
                        style: const TextStyle(
                            fontSize: 29, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 16.0), //luar kotak
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: [
                              Icon(Icons.star),
                              SizedBox(height: 8.0),
                              Text(detailproduk.rating)
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            const Icon(Icons.monetization_on),
                            const SizedBox(height: 8.0),
                            Text(
                              detailproduk.harga,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 14),
              child: const Text(
                "Detail",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      detailproduk.deskripsi,
                      textAlign: TextAlign.justify,
                    ))),
            // Container(
            //   margin: const EdgeInsets.only(top: 18, left: 20, bottom: 10),
            //   child: const Text(
            //     "Keunggulan",
            //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(left: 12),
            //   height: 150,
            //   child: ListView(
            //     children: detailproduk.keunggulan.map((url) {
            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(url),
            //       );
            //     }).toList(),
            //   ),
            // ),
            // Container(
            //   child: Card(
            //     margin: EdgeInsets.all(10),
            //     color: Color.fromARGB(255, 244, 54, 158),
            //     child: TextButton(
            //       onPressed: () {},
            //       child: Text(
            //         "ADD TO CART",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if (index == 2){
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
          }
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.cyan,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
