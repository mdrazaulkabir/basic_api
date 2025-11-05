import 'dart:convert';

import 'package:basic_api/factoryMethodUsed/postModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Allcodebyfactorymethod extends StatefulWidget {
  const Allcodebyfactorymethod({super.key});

  @override
  State<Allcodebyfactorymethod> createState() => _AllcodebyfactorymethodState();
}

class _AllcodebyfactorymethodState extends State<Allcodebyfactorymethod> {
  List<PostModel>posts = [];

  Future fetchData() async {
    final uri=Uri.parse("https://newsapi.org/v2/everything?apiKey=0a24ad29197a438f9d75fb1c492f20f3&q=1");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print(""""""""'Successfully fetching data:'"""""""");
      final jsonData = jsonDecode(response.body);
      //print(jsonData['articles']);
      final listDataAll = jsonData['articles'] as List;

      for (var listData in listDataAll) {
        posts.add(PostModel.formJson(listData));

        //this part is not need now because we created factory method like PostModel.formJson
        // posts.add(
        //   PostModel(
        //     title: allPost['title'],
        //     description: allPost['description'],
        //     urlToImage: allPost['urlToImage'],
        //   ),
        // );
      }

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Using by factory method all code',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey,
                Colors.lightBlue,
                Colors.greenAccent,
                Colors.lightGreen,
                Colors.white,
                Colors.yellowAccent,
                Colors.lightGreenAccent,
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: posts.length,
          itemBuilder: (context,index){
          final data=posts[index];
        return Card(
          child: ListTile(
            title: Text("Title:${data.title}"),
            subtitle: Text('Description${data.description}',maxLines: 1,overflow: TextOverflow.ellipsis,),
            leading:Image.network(data.urlToImage,height: double.maxFinite,),
          ),
        );
      })
    );
  }
}
