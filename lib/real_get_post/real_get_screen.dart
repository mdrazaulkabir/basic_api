import 'package:basic_api/real_get_post/real_api_call.dart';
import 'package:flutter/material.dart';
class RealGetScreen extends StatefulWidget {
  const RealGetScreen({super.key});

  @override
  State<RealGetScreen> createState() => _RealGetScreenState();
}

class _RealGetScreenState extends State<RealGetScreen> {

  // List<RealGetModel>listData=[];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fetchData();
  // }
  // fetchData()async{
  //   final data = await RealApiCall.realGetFetchData();
  //   listData=data!;
  //   print(listData.length);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get api Screen by server!'),centerTitle: true,),
      body: FutureBuilder(
        future: RealApiCall.realGetFetchData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            Center(
              child: CircularProgressIndicator(),
            );
          }
          final dataList=snapshot.data!;
          print("check length:${dataList.length}");
          return ListView.builder(
            itemCount: dataList.length,
              //itemCount: listData.length,

              itemBuilder: (context, index) {
                final data = dataList[index];
                // final data=listData[index];
            return Card(
              elevation: 10,
              child: ListTile(
                leading: Image.network(data.urlToImage),
                trailing: Text("$index"),
                title: Text("Title is: ${data.title}"),
                subtitle: Text("Description is: ${data.description}",maxLines: 2,overflow:TextOverflow.ellipsis,),
              ),
            );
          });
        }
      ),
    );
  }
}
