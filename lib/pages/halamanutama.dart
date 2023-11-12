import 'package:flutter/material.dart';
import 'package:skincare/model/jenis.dart';
import 'package:skincare/pages/gridviews.dart';
import 'package:skincare/widgets/HomeAppBar.dart';
import 'package:skincare/widgets/fecthApi.dart';


class Utama extends StatefulWidget {
  @override
  State<Utama> createState() => _UtamaState();
}

class _UtamaState extends State<Utama> {
  List datalist = [];

  @override
    void setupdata() async {
    APiFetch fetch = new APiFetch();
    await fetch.getapiData();
    setState(() {
      datalist = fetch.data_api;
    });

    if (datalist.isEmpty) {
      print("data kosong");
    } else {
      print("data sudah terisi");
    }
  }

  void initState() {

    setupdata();
    super.initState();
  }

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
        onTap: (value) {
          
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
