import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skincare/pages/login.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
  }

  Future<void> showUpdateNicknameDialog(BuildContext context, String currentNickname) async {
    TextEditingController nicknameController = TextEditingController(text: currentNickname);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Nickname'),
          content: TextField(
            controller: nicknameController,
            decoration: InputDecoration(hintText: 'Enter new nickname'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Update'),
              onPressed: () async {
                Navigator.of(context).pop();
                String newNickname = nicknameController.text;

                try {
                  await updateUserInFirestore(currentUser.uid, {'nickname': newNickname});
                  // Optional: Refresh UI or show success message
                } catch (e) {
                  // Handle errors, show error message or perform appropriate action
                  print('Error updating nickname: $e');
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> updateUserInFirestore(String userId, Map<String, dynamic> updatedUserData) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(userId).update(updatedUserData);
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.pink)),
            Text(' Page', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black87)),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
              },
              icon: Icon(Icons.logout, color: Colors.black87),
            ),
          )
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("users").doc(currentUser.uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/image/vivin.jpg"),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(userData['nickname'], style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fullname", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black54)),
                        SizedBox(height: 8),
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(prefixIcon: Icon(Icons.person), hintText: userData['fullname']),
                        ),
                        SizedBox(height: 8.0),
                        Text("Nickname", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black54)),
                        SizedBox(height: 8),
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(prefixIcon: Icon(Icons.person), hintText: userData['nickname']),
                        ),
                        SizedBox(height: 8.0),
                        Text("Email", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black54)),
                        SizedBox(height: 8),
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(prefixIcon: Icon(Icons.email), hintText: currentUser.email!),
                        ),
                        SizedBox(
                          child: Center(
                            child: ElevatedButton(
                              style: ButtonStyle(alignment: Alignment.bottomCenter),
                              onPressed: () async {
                                await showUpdateNicknameDialog(context, userData['nickname'],
                                );
                              },
                              child: Text('UPDATE'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
