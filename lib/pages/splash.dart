import 'package:flutter/material.dart';
import 'package:skincare/pages/login.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background warna hitam
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/image/Group 1.png'), // Mengambil logo dari folder assets
            Text(
              'Kecantikan sejati dimulai dari sini',
              
              style: TextStyle(
                
                color: Colors.white, // Warna teks putih
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 19, 18, 18), // Background tombol warna pink
        child: Container(
          height: 60.0,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman login ketika tombol ditekan
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Login(),
                ));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromHeight(50),
                primary: Color.fromARGB(255, 229, 129, 162), // Background tombol warna pink
                onPrimary: Colors.white, // Warna teks putih
                // shape: CircleBorder(side: BorderSide(width: 23))
              ),
              child: Text('Getting Started'),
            ),
          ),
        ),
      ),
    );
  }
}


