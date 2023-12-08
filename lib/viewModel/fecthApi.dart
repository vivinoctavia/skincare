import 'dart:convert'; //melakukan decode atau encode
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:skincare/model/jenis.dart';

class Repository {
  final String apiUrl = "https://make-up2-default-rtdb.firebaseio.com/makeup2.json";

  Future<List<DataJenis>> fetchDataMakeUp() async {
    Response response = await http.get(Uri.parse(apiUrl));
    
    List<DataJenis> dataMakeUp;
    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> jsonData = json.decode(response.body);

        // print(jsonData);
      dataMakeUp = jsonData.values.map((value) {
        return DataJenis.fromJson(value);
      }).toList();
    //print(dataMakeUp[1].merk);

      return dataMakeUp;
    } else {
      throw Exception('Failed to load data places');
    }
  }
}