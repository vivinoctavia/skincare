import 'package:flutter/material.dart';
import 'package:skincare/pages/detailview.dart';
import 'package:skincare/pages/halamanutama.dart';
import 'package:skincare/widgets/HomeAppBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routes: {
        "/": (context) => Utama(),
        // "/profile" : (context) => ),
        // "/utama": (context) => Utama(),
      },
    );
  }
}
