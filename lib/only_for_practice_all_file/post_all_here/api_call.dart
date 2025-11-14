import 'dart:convert';

import 'package:http/http.dart' as httop;
class ApiCall{
  static Future postCreate(String firstName, String lastName)async{
    final uri = Uri.parse('https://restful-booker.herokuapp.com/booking/');
    var body = {
      "firstname": firstName,
      "lastname": lastName,
      "totalprice": 111,
      "depositpaid": true,
      "bookingdates": {
        "checkin": "2018-01-01",
        "checkout": "2019-01-01"
      },
      "additionalneeds": "superb owls"
    };
    final response = await httop.post(
      uri,
      body: jsonEncode(body),
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