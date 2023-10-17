// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile Page"),
//       ),
//       body: Column(
//         children: [
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height * 0.30,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage('url'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     image: DecorationImage(
//                         fit: BoxFit.cover, image: AssetImage('assetName'))),
//               ),
//               Center(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 12,
//                     ),
//                     Text(
//                       'Vivin Octavia Cahyani',
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text('Owner True Beauty'),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton.icon(
//                             onPressed: () {
//                               launchUrlString("");
//                             },
//                             icon: Icon(Icons.message),
//                             label: Text('Message'),
//                             ),
//                             SizedBox(width: 5),
//                             ElevatedButton.icon(
//                             onPressed: () {
//                               launchUrlString("");
//                             },
//                             icon: Icon(Icons.message),
//                             label: Text('Message'),
//                             ),
//                       ],
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
