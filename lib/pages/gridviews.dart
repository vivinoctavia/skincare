import 'package:flutter/material.dart';
import 'package:skincare/model/data_produk.dart';
import 'package:skincare/model/jenis.dart';
import 'package:skincare/pages/favorit.dart';
import 'package:skincare/pages/detailview.dart';
import 'package:skincare/widgets/fectApi2.dart';

class Haldua extends StatefulWidget {
   Haldua({super.key, required item});
  

  @override
  _HalduaState createState() => _HalduaState();
}

class _HalduaState extends State<Haldua> {
   Repository2 repo3 = Repository2();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [], backgroundColor: Colors.pink[200]),
      body: 
      FutureBuilder<List<dynamic>>(
        future: repo3.fetchDataMakeUp2(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          } else if (snapshot.hasData) {
                List<dynamic> data = snapshot.data as List<dynamic>;
                return CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 180,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  
                  // final filteredDataProdukList = dataprodukList.where((dataProduk) => dataProduk. == widget.produk.name).toList();

                  if (index < data.length) {
                    final dynamic item = data[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return detail(detailproduk: data[index]);
                          }),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.pink[200],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(),
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              snapshot.data[index].gambar,
                              width: 100,
                            ),
                            Text(snapshot.data[index].merk),
                            Text(snapshot.data[index].harga),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
                childCount: data.length,
              ),
            ),
          ),
        ],
                );
          } else{
             return Center(child: CircularProgressIndicator());
          }
      }
      )
    );
  }
}
