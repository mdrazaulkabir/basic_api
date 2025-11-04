import 'dart:convert';

import 'package:basic_api/model/postModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getapicallbymodel extends StatefulWidget {
  const Getapicallbymodel({super.key});

  @override
  State<Getapicallbymodel> createState() => _GetapicallbymodelState();
}

class _GetapicallbymodelState extends State<Getapicallbymodel> {
  List<PostModel> post = [];

  Future fetchData() async {
    final uri = Uri.parse(
      "https://newsapi.org/v2/everything?apiKey=0a24ad29197a438f9d75fb1c492f20f3&q=1",
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print("Your api calling is successfully and fetching data!");
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      final listData = jsonData['articles'] as List;
      print(listData);
      for (var allPost in listData) {
        // print(allPost['title']);
        // post=allPost;  //error:Unhandled Exception: type '_Map<String, dynamic>' is not a subtype of type 'List<PostModel>'
        post.add(
          PostModel(
            title: allPost['title'],
            description: allPost['description'],
            urlToImage: allPost['urlToImage'],
          ),
        );
      }
      //post=listData;
    } else {
      print("your api calling failed not find any data!");
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
          "Get Api Call By Using Model",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // backgroundColor: Colors.greenAccent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.blue, Colors.white, Colors.black],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: post.length,
        itemBuilder: (context, index) {
          final data = post[index];
          return Card(
            child: ListTile(
              leading: Image.network(data.urlToImage),
              title: Text("Name: ${data.title}"),
              subtitle: Text(
                "Description:${data.description}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
    );
  }
}
