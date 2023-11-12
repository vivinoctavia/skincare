import 'dart:convert';

import 'package:http/http.dart' as http;
class APiFetch{
  List data_api =[];

  //Fungsi untuk fetch API
  Future<void> getapiData () async{
     var response = await http.get(
      Uri.parse("http://makeup-api.herokuapp.com/api/v1/products.json")
      );
      if (response.statusCode == 200){
        List data = jsonDecode(response.body);
        data_api = data;
      }else{
        print("Has no Data API");
      }
  }
}