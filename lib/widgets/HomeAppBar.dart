import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key); // Menggunakan Key dengan benar

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(Icons.sort, size: 30, color: Colors.black),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Center(
              child: Text(
                "True Beauty ",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Spacer(), // Untuk memberikan ruang di antara teks dan ikon lonceng
          Icon(
            Icons.notifications, // Ikon lonceng
            size: 30,
            color: Colors.black,
          ),
          // Anda dapat menambahkan logika untuk menangani tindakan ketika ikon lonceng ditekan di sini
          // IconButton(
          //   icon: Icon(Icons.shop),
          //   onPressed: () {
          //     // Implement shopping cart functionality here
          //   },
          // ),
        ],
      ),
    );
  }
}
