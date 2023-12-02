import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:skincare/pages/detailview.dart';
// import 'package:skincare/pages/halamanutama.dart';
import 'package:skincare/pages/halamanutama1.dart';
import 'package:skincare/pages/splash.dart';
// import 'package:skincare/pages/home_user.dart';
// import 'package:skincare/pages/login.dart';
// import 'package:skincare/pages/profile.dart';
// import 'package:skincare/pages/register.dart';
// import 'package:skincare/widgets/HomeAppBar.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:925339100007:android:9412d59a8d4e0c64f945c2',
      apiKey: 'AIzaSyBR-SRELzcU-9JtADmDsuvWO14rumxReCA',
      messagingSenderId: '925339100007',
      projectId: 'makeup-9cf34',
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: SplashScreen(),
      routes: {
        // "/listUser": (context) =>HomeUser()
        // "/profile" : (context) => ),
        // "/utama": (context) => Utama(),
      },
    );
  }
}


