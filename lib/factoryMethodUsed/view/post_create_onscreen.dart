import 'package:basic_api/factoryMethodUsed/api_services_class/api_services.dart';
import 'package:flutter/material.dart';
class PostCreateOnscreen extends StatefulWidget {
  const PostCreateOnscreen({super.key});

  @override
  State<PostCreateOnscreen> createState() => _PostCreateOnscreenState();
}

class _PostCreateOnscreenState extends State<PostCreateOnscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Create by Screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
        centerTitle: true,flexibleSpace: Container(
decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blue,Colors.yellowAccent,Colors.greenAccent,Colors.lime])),
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your title'
              ),
            ),
          SizedBox(height: 15,),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
            hintText: "Enter your description!",

          ),)
        ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ApiServices.postCreate();
      },
      child: Icon(Icons.add),),
    );
  }
}
