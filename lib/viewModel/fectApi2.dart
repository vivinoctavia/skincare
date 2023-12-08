import 'dart:convert'; //melakukan decode atau encode
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:skincare/model/data_produk.dart';
import 'package:skincare/model/jenis.dart';

class Repository2 {
  final String apiUrl = "https://makeup-9cf34-default-rtdb.firebaseio.com/make-up.json";

  Future<List<DataProduct>> fetchDataMakeUp2() async {
    Response response = await http.get(Uri.parse(apiUrl));
    
    List<DataProduct> dataMakeUp2;
    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> jsonData = json.decode(response.body);

        // print(jsonData);
      dataMakeUp2 = jsonData.values.map((value) {
        return DataProduct.fromJson(value);
      }).toList();
    //print(dataMakeUp[1].merk);

      return dataMakeUp2;
    } else {
      throw Exception('Failed to load data places');
    }
  }
}