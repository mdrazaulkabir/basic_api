import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class GetApi extends StatefulWidget {

  const GetApi({super.key});

  @override
  State<GetApi> createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  List <dynamic> postList=[];
  Future fetchData()async{
    final url=Uri.parse('https://newsapi.org/v2/everything?apiKey=0a24ad29197a438f9d75fb1c492f20f3&q=1');
    final response=await http.get(url);
    // print(response.body);
    if(response.statusCode==200){
      print(''''''''''''"without the decoded body like:"'''''''''''');
      // print(response.body);
      // print(response.body.length);
      //print(response.body.runtimeType);
      final jsonData= jsonDecode(response.body);

      print(''''''''"after decoded the jsonData like:"'''''''''''''');
      //print(jsonData);
      //print(jsonData['articles']);
      //print(jsonData.runtimeType);
      final listByList=jsonData['articles'] as List;
      postList=listByList;
      print(postList.length);
    }
    else{
      print('""""""""Unsuccessfully! your api url is not finding """"""');
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
          "Get api calling ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (context,index){
            final data=postList[index];
            return Card(
              child: ListTile(
                leading: Image.network(data['urlToImage']),
                title: Text("Title:${data["title"]}",style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('Description${data["description"]}',maxLines:1,overflow: TextOverflow.ellipsis),
              ),
            );
          }),
    );
  }
}
