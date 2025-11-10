import 'package:basic_api/get_post_allOne_folder/api_services/api_services_class.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiServicesClass.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Screen",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: Icon(Icons.person,color: Colors.yellowAccent,),
        centerTitle: true,elevation: 14,
        flexibleSpace:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.greenAccent,Colors.lightGreenAccent,Colors.lightBlueAccent,Colors.yellowAccent])
          ),
        )
      ),

      // body: FutureBuilder(
      //     future:ApiServicesClass.fetchData(),
      //     builder:(context,snapshot){
      //   print('here is come or not : ${snapshot.data!}');
      //   if(snapshot.connectionState==ConnectionState.waiting){
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   }
      //   return ListView.builder(
      //     itemCount:snapshot.data!.length,
      //       itemBuilder: (context,index){
      //       final data=snapshot.data![index];
      //     return Card(
      //       child: ListTile(
      //         title: Text("Product Name:${data.productName}"),
      //         subtitle: Text("Product id:"),
      //         trailing: Row(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Text('product code:'),
      //             Text('Qty:'),
      //             Spacer(),
      //             Text('Unit price :'),
      //             Text('Total price :'),
      //           ],
      //         ),
      //       ),
      //     );
      //   });
      // }),

    );
  }
}
