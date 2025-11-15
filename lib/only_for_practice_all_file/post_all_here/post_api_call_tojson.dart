import 'dart:convert';

import 'package:basic_api/only_for_practice_all_file/post_all_here/post_model_practice.dart';
import 'package:http/http.dart' as httop;
class PostApiCallTojson{
  static Future post_api_call(PostModelPractice model2)async{
    final uri = Uri.parse('https://restful-booker.herokuapp.com/booking/');
    // var body = {
    //   "firstname": firstName,
    //   "lastname": lastName,
    //   "totalprice": 111,
    //   "depositpaid": true,
    //   "bookingdates": {
    //     "checkin": "2018-01-01",
    //     "checkout": "2019-01-01"
    //   },
    //   "additionalneeds": "superb owls"
    // };
    final response = await httop.post(
      uri,
      body: jsonEncode(model2.tojosn()),
      headers: {
        //we need to show the headers condition
        //if you don't do this show will be internal server error
        "Content-Type": "application/json", // Required for JSON  //What you’re sending
        "Accept": "application/json"                              //What you expect back
      },
    );
    if(response.statusCode==200){
      print("successfully create your post in server");
      print(response.body);
    }
    else{
      print("Fail! you are not to success to create post in server!");
      print(response.body);
    }
  }
}