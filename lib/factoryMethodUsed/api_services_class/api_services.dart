import 'dart:convert';

import 'package:basic_api/factoryMethodUsed/model/postModel.dart';
import 'package:basic_api/factoryMethodUsed/model/post_model_details.dart';
import 'package:http/http.dart' as http;

class ApiServices{
  static Future<List<PostModel>?> fetchData() async {
    final uri=Uri.parse("https://newsapi.org/v2/everything?apiKey=0a24ad29197a438f9d75fb1c492f20f3&q=1");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print(""""""""'Successfully fetching data:'"""""""");
      final jsonData = jsonDecode(response.body);
      //print(jsonData['articles']);
      final listDataAll = jsonData['articles'] as List;
      print(listDataAll.length);

      return listDataAll.map((jsonList)=>PostModel.formJson(jsonList)).toList();


      //this part: no need we used map here
      // for (var listData in listDataAll) {
      //   posts.add(PostModel.formJson(listData));
      //
      //   //this part: is not need now because we created factory method like PostModel.formJson
      //   // posts.add(
      //   //   PostModel(
      //   //     title: allPost['title'],
      //   //     description: allPost['description'],
      //   //     urlToImage: allPost['urlToImage'],
      //   //   ),
      //   // );
      // }

    }
    else{
      print('''''''''Your api calling not fetching ant data''''''''');
      return null;
    }
  }
  static Future<PostModelDetails?> singleFetchDetails(int index)async{
    final response=await http.get(Uri.parse("https://newsapi.org/v2/everything?apiKey=0a24ad29197a438f9d75fb1c492f20f3&q=1 "));
    if(response.statusCode==200){
      final sinlgeJosnData = jsonDecode(response.body);
      final singelData = sinlgeJosnData['articles'] as List;

      final singleArticles = singelData[index];
      return PostModelDetails.formJson(singleArticles);
    }
    else{
      print("Not successfully single fetch data!");
      return null;
    }
  }

  static Future postCreate()async{
    final response = await http.post(
      body: {
      },
      headers: {'accept': 'application/json'},
      Uri.parse(""),
    );
    if(response.statusCode==200){
      print('successfully created post!');
    }
    else{
      print('failed not created post!');
      print(response.body);  // for debug (checking which properties is missing in body)
    }
  }
}