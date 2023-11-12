import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Gambar latar belakang
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    
                    image: AssetImage("assets/image/free.jpg"), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              Container(
                
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/free.jpg"), 
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 12),
                Text(
                  'Vivin Octavia Cahyani',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Text('Owner True Beauty'),
                SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        launchUrlString("https://web.facebook.com/hazmihas/");
                      },
                      icon: Icon(Icons.facebook),
                      label: Text('Facebook'),
                    ),
                    SizedBox(width: 5),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Implement your message button action here
                        launchUrlString("https://msng.link/o?089530454703=wa");
                      },
                      icon: Icon(Icons.message),
                      label: Text('Message'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  void launchUrlString(String s) {}
}