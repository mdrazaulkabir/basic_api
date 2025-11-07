import 'dart:convert';

import 'package:basic_api/factoryMethodUsed/postModel.dart';
import 'package:http/http.dart' as http;
class ApiServices{
  Future<List<PostModel>?>fetchData()async{
    final respone=await http.get(Uri.parse("https://newsapi.org/v2/everything?apiKey=0a24ad29197a438f9d75fb1c492f20f3&q=1"));
    if(respone.statusCode==200){
      final jsonData=jsonDecode(respone.body);
      final jsonList=jsonData['articles'] as List;
      return jsonList.map((datajson)=>PostModel.formJson(datajson)).toList();
    }
    else{
      print("Unsuccessfully not fetch any data!");
      return null;
    }
  }
}