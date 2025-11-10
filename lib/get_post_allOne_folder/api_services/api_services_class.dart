import 'dart:convert';

import 'package:basic_api/get_post_allOne_folder/model/profile_model.dart';
import 'package:basic_api/get_post_allOne_folder/url/url.dart';
import 'package:http/http.dart' as http;
class ApiServicesClass{
  static Future<List<ProfileModel>?> fetchData()async{
    final response = await http.get(Uri.parse(Url.profileDetailsUrl));
    if(response.statusCode==200){
      final jsonData=jsonDecode(response.body);
      //print(jsonData);
      final jsonlist=jsonData['data'] as List;
      print(jsonlist.length);
      print(jsonlist);
     return jsonlist.map((e)=>ProfileModel.fromJson(e)).toList();
    }
    else{
      print('Not fetching data in api server!');
      print(response.statusCode);
      return null;
    }
  }
  static Future createPost()async{
    final response=await http.post(
        body: {
          {
            "_id": "6853d1303561f88d4fc9e6ac",
            "ProductName": "apple gold phone",
            "ProductCode": 156156,
            "Img": "https://blog.sothebysrealty.ae/hubfs/Imported_Blog_Media/58f716a8-6cbe-40fe-830b-d18f976e22af-3.jpg",
            "Qty": 45,
            "UnitPrice": 14,
            "TotalPrice": 888
          }
        },
        Uri.parse(Url.postCreate
        ));
    if(response.statusCode==200){
      print('Created the prost');
    }
    else{
      print("api not fetching the data");
      return null;
    }

  }
}