import 'package:flutter/material.dart';
import 'package:skincare/model/jenis.dart';
import 'package:skincare/pages/gridviews.dart';
import 'package:skincare/widgets/HomeAppBar.dart';

// import 'package:infinite_carousel/infinite_carousel.dart';

class Utama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Home(),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                // IconButton(
                //   icon: Icon(Icons.filter),
                //   onPressed: () {
                //     // Implement filter functionality here
                //   },

                // ),
              ],
            ),
          ),
          // Container(
          //   height: 200,
          //   child: InfiniteCarousel.builder(
          //     itemCount: 10,
          //     itemExtent: 120,
          //     center: true,
          //     anchor: 0.0,
          //     velocityFactor: 0.2,
          //     onIndexChanged: (index) {},
          //     controller: ScrollController(),
          //     axisDirection: Axis.horizontal,
          //     loop: true,
          //     itemBuilder: (context, itemIndex, realIndex) {
          //       return Container(
          //         child: Row(
          //           children: [
          //             Image.asset("assets/image/k1.jpg"),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 20,
                child: Row(
                  children: [
                    Text(
                      'All You Like',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.pink[200],
                borderRadius: BorderRadius.circular(10)),
            height: 100,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/image/k1.jpg"),
                  SizedBox(width: 50),
                  Image.asset("assets/image/lip.png"),
                  SizedBox(width: 50),
                  Image.asset("assets/image/lipstik.jpg"),
                  SizedBox(width: 50),
                  Image.asset("assets/image/head2.jpg"),
                  SizedBox(
                    width: 50,
                  ),
                  Image.asset("assets/image/head1.png"),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Top Products',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Column(
                    children: produkList.map((produk) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Haldua(produk: produk),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        child: ListTile(
                          leading: Image.asset(
                            produk.gambar,
                            width: 100,
                          ),
                          title: Text(produk.produk),
                          subtitle: Text(produk.ket),
                        ),
                      ),
                    ),
                  );
                }).toList())
                // List of product containers here
              ],
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
