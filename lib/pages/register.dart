import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skincare/pages/firebase_auth.dart';
import 'package:skincare/pages/halamanutama.dart';
import 'package:skincare/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FireBaseAuthService _authService = FireBaseAuthService();
  final TextEditingController controllerFullname = TextEditingController();
  final TextEditingController controllerNickname = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPass.dispose();
    super.dispose();
  }

  void register() async {
    String fullname = controllerFullname.text;
    String nickname = controllerNickname.text;
    String email = controllerEmail.text;
    String password = controllerPass.text;
    User? user = await _authService.signUpWithEmailandPassword(email, password, context);

    if (user != null) {
      try {
        FirebaseFirestore firestore = FirebaseFirestore.instance;

        String collectionPath ='users';

      await firestore.collection(collectionPath).doc(user.uid).set({
        'fullname': fullname,
        'nickname':nickname,
        'email': email,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User is successfully created"),
      backgroundColor: Colors.green));
      } catch (e){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Tidak dapat menyimpan data pengguna"),
        backgroundColor: Colors.red,),
        );
      }


      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cannot create user"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/Group 1.png'),
              const Text(
                "Register Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ), 
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: controllerFullname,
                decoration: const InputDecoration(
                  // prefixIcon: Icon(Icons.email),
                  hintText: "Fullname",
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: controllerNickname,
                decoration: const InputDecoration(
                  // prefixIcon: Icon(Icons.email),
                  hintText: "Nickname",
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: controllerEmail,
                decoration: const InputDecoration(
                  // prefixIcon: Icon(Icons.email),
                  hintText: "Email Address",
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: controllerPass,
                decoration: const InputDecoration(
                  // prefixIcon: Icon(Icons.key),
                  hintText: "Password",
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      register();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 238, 91, 140)),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already has an account?"),
                  const SizedBox(width: 8.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Login()));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Color.fromARGB(255, 222, 110, 147)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}