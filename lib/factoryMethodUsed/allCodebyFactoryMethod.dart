
import 'package:basic_api/factoryMethodUsed/api_services.dart';
import 'package:basic_api/factoryMethodUsed/postModel.dart';
import 'package:flutter/material.dart';

class Allcodebyfactorymethod extends StatefulWidget {
  const Allcodebyfactorymethod({super.key});

  @override
  State<Allcodebyfactorymethod> createState() => _AllcodebyfactorymethodState();
}

class _AllcodebyfactorymethodState extends State<Allcodebyfactorymethod> {
  List<PostModel>posts = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  fetchData() async{
    final data=await ApiServices.fetchData();
    print(data?.length);

    posts=data!;

    // setState(() {
    //   posts=data!;
    // });
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
