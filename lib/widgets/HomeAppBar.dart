import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key); 

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
          Spacer(), 
          Icon(
            Icons.notifications, 
            size: 30,
            color: Colors.black,
          ),
          
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
