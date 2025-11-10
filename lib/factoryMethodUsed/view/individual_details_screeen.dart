import 'package:basic_api/factoryMethodUsed/api_services_class/api_services.dart';
import 'package:flutter/material.dart';

class IndividualDetailsScreeen extends StatefulWidget {
  final String postId;
  const IndividualDetailsScreeen({super.key, required this.postId});

  @override
  State<IndividualDetailsScreeen> createState() => _IndividualDetailsScreeenState();
}

class _IndividualDetailsScreeenState extends State<IndividualDetailsScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Individual Details Screen: ${widget.postId}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.greenAccent,
                Colors.lime,
                Colors.white,
                Colors.amberAccent,
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder(
          future: ApiServices.singleFetchDetails( int.parse(widget.postId)) ,    //vvi for single one articles
          builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else{final data=snapshot.data!;
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('${data.urlToImage}'),
              Text("Title is : ${data.title}",style: TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
              Text("Description is : ${data.description}",maxLines: 3,overflow:TextOverflow.ellipsis),
              Card(
                child: ListTile(
                  title: Text("Author name:${data.sources.name}",style: TextStyle(fontWeight: FontWeight.bold,),),
                  subtitle: Text("Sources id is: ${data.sources.id}"),
                ),
              )
            ],
          ),
        );
        }
      }),
    );
  }
}
