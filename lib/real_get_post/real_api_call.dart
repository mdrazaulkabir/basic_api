import 'dart:convert';

import 'package:http/http.dart' as http;

class RealApiCall {
  static Future realGetFetchData() async {
    final uri = Uri.parse('https://restful-booker.herokuapp.com/booking/');
    final response = await http.get(uri);
    if(response.statusCode==200){
      print('Successfully hit api server!');
      final jsonAllData=jsonDecode(response.body);
      print(jsonAllData);
      print('object');
      final jsonData=jsonAllData;
      print(jsonData);
    }
    else{
      print('Faild to hit api server!');
    }
  }
}
