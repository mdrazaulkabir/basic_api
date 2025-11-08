import 'package:basic_api/factoryMethodUsed/api_services.dart';
import 'package:basic_api/factoryMethodUsed/individual_details_screeen.dart';
import 'package:flutter/material.dart';

class Allcodebyfactorymethod extends StatefulWidget {
  const Allcodebyfactorymethod({super.key});

  @override
  State<Allcodebyfactorymethod> createState() => _AllcodebyfactorymethodState();
}

class _AllcodebyfactorymethodState extends State<Allcodebyfactorymethod> {
  // List<PostModel>posts = [];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fetchData();
  // }
  // fetchData() async{
  //   final data=await ApiServices.fetchData();
  //   print(data?.length);
  //   posts=data!;
  //   // setState(() {
  //   //   posts=data!;
  //   // });
  // }

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
      body: FutureBuilder(
        future: ApiServices.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final data = snapshot.data![index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IndividualDetailsScreeen(
                        postId: index.toString(),
                        //postId: data.publishedAt.toString(),
                      ),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text("Title:${data.title}"),
                    subtitle: Text(
                      'Description${data.description}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: Image.network(
                      data.urlToImage,
                      height: double.maxFinite,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
