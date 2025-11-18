import 'dart:convert';

import 'package:basic_api/real_get_post/real_get_model.dart';
import 'package:http/http.dart' as http;

class RealApiCall {
  static Future<List<RealGetModel>?> realGetFetchData() async {
    try{
      final uri = Uri.parse('https://newsapi.org/v2/everything?apiKey=0a24ad29197a438f9d75fb1c492f20f3&q=1');
      final response = await http.get(uri);
      if(response.statusCode==200){
        print('Successfully hit api server!');
        final jsonAllData=jsonDecode(response.body);
        print(jsonAllData);
        print('object');
        final jsonData=jsonAllData['articles'] as List;
        print(jsonData.length);
        return jsonData.map((e)=>RealGetModel.formJson(e)).toList();
      }
      else{
        print('Faild to hit api server!');
        return null;
      }
    }
    catch(e){
      print(e);
      return null;
    }
  }
}
