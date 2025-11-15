import 'package:basic_api/only_for_practice_all_file/post_all_here/post_api_call_tojson.dart';
import 'package:basic_api/only_for_practice_all_file/post_all_here/post_model_practice.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   ApiCall.postCreate();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post create api only ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.blue,
                Colors.white,
                Colors.redAccent,
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: firstName,
                decoration: InputDecoration(
                    hintText: 'Enter your first name',
                    labelText: "First name:"
                ),
              ),
              TextField(
                controller: lastName,
                decoration: InputDecoration(
                    hintText: 'Enter your first name',
                    labelText: "First name:"
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
       final model1= PostModelPractice(firstName: firstName.text,
            lastName: lastName.text,
            totalPrice: 11,
            despositpaid: true,
            bookingDate: (BookingDate(checkIn: "14-11-25", checkOut: "15O-11-25 ")),
            additionalneeds: 'good');
            PostApiCallTojson.post_api_call(model1);
        //ApiCall.postCreate(firstName.text, lastName.text);
      },
        child: Icon(Icons.done),),
    );
  }
}
