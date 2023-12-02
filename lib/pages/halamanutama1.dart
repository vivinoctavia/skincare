import 'package:flutter/material.dart';
import 'package:skincare/pages/gridviews.dart';
import 'package:skincare/pages/profile.dart';
import 'package:skincare/widgets/HomeAppBar.dart';
import 'package:skincare/widgets/fecthApi.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Repository repo = Repository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  ListView(
        children: [
          Home(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 20,
                child: Row(
                  children: [
                    Text(
                      'All You Like',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.pink[200],
                borderRadius: BorderRadius.circular(10)),
            height: 100,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/image/k1.jpg"),
                  SizedBox(width: 50),
                  Image.asset("assets/image/lip.png"),
                  SizedBox(width: 50),
                  Image.asset("assets/image/lipstik.jpg"),
                  SizedBox(width: 50),
                  Image.asset("assets/image/head2.jpg"),
                  SizedBox(
                    width: 50,
                  ),
                  Image.asset("assets/image/head1.png"),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Top Products',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 500,
                  child: FutureBuilder<List<dynamic>>(
                          future: repo.fetchDataMakeUp(),
                          builder: (BuildContext context, AsyncSnapshot snapshot) 
                          {
                            print(snapshot.data);
                            if (snapshot.hasData) {
                              return ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Haldua(item : snapshot.data[index]),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          child: ListTile(
                            leading: Image.network(
                              snapshot.data[index].gambar,
                              width: 100,
                            ),
                            title: Text(snapshot.data[index].jenis),
                            subtitle: Text(snapshot.data[index].ket),
                          ),
                        ),
                      ),
                    );
                    });
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                ),
                // List of product containers here
              ],
            ),
          ),
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.cyan,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
          onTap: (int index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          }
        },

      ),
      
        
    
        );
  }
}
