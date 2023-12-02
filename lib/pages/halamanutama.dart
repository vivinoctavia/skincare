// import 'package:flutter/material.dart';
// import 'package:skincare/model/data_produk.dart';
// import 'package:skincare/model/jenis.dart';
// import 'package:skincare/pages/Favorit.dart';
// import 'package:skincare/pages/gridviews.dart';
// import 'package:skincare/pages/profile.dart';
// import 'package:skincare/widgets/HomeAppBar.dart';
// import 'package:skincare/widgets/fecthApi.dart';

// class Utama extends StatefulWidget {
//   @override
//   State<Utama> createState() => _UtamaState();
// }

// class _UtamaState extends State<Utama> {
//   Repository repo = Repository();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: repo.fetchDataMakeUp(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {
//             List<DataProduct> data = snapshot.data;
//             return ListView(
//               children: [
//                 Home(), // Assuming HomeAppBar is supposed to be here
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 20,
//                     child: Row(
//                       children: [
//                         Text(
//                           'All You Like',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.pink[200],
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   height: 100,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     padding: EdgeInsets.all(10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Image.asset("assets/image/k1.jpg"),
//                         SizedBox(width: 50),
//                         Image.asset("assets/image/lip.png"),
//                         SizedBox(width: 50),
//                         Image.asset("assets/image/lipstik.jpg"),
//                         SizedBox(width: 50),
//                         Image.asset("assets/image/head2.jpg"),
//                         SizedBox(width: 50),
//                         Image.asset("assets/image/head1.png"),
//                         SizedBox(width: 50),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Top Products',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 10.0),

//                       ListView.builder(
//                         itemCount: data.length,
//                         itemBuilder: (context, index) {
                          
//                          return GestureDetector(
//                          child: Text(data[index].merk),
//                          );

//                         },
//                       ),

//                       Column(
//                         children: DataProduct.fromJson.((merk) {
//                           return GestureDetector(
//                             onTap: () {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (context) => Haldua(produk: produk),
//                                 ),
//                               );
//                             },
//                             child: Container(
//                               margin: EdgeInsets.only(bottom: 16.0),
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey),
//                                 borderRadius: BorderRadius.circular(12.0),
//                               ),
//                               child: ListTile(
//                                 leading: Image.asset(
//                                   produk.gambar,
//                                   width: 100,
//                                 ),
//                                 title: Text(produk.produk),
//                                 subtitle: Text(produk.ket),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text("Error fetching data"),
//             );
//           }
//           // By default, show a loading spinner
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),//body
//     );
//   }
// }
