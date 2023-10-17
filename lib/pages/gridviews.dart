import 'package:flutter/material.dart';
import 'package:skincare/model/data_produk.dart';
import 'package:skincare/model/jenis.dart';
import 'package:skincare/pages/detailview.dart';

class Haldua extends StatelessWidget {
  Haldua({Key? key, required this.produk});
  final ProductContainer produk;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [], backgroundColor: Colors.pink[200]),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: 16.0), // Add the desired horizontal padding
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 180,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final filteredDataProdukList = dataprodukList
                      .where((dataProduk) => dataProduk.jenis == produk.produk)
                      .toList();

                  if (index < filteredDataProdukList.length) {
                    final dataProduk = filteredDataProdukList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return detail(detailproduk: dataProduk);
                        }));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.pink[200],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              dataProduk.gambar,
                              width: 100,
                            ),
                            Text(dataProduk.merk),
                            Text(dataProduk.harga),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
                childCount: dataprodukList
                    .where((dataProduk) => dataProduk.jenis == produk.produk)
                    .length,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
