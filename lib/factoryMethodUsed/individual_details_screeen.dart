import 'package:flutter/material.dart';

class IndividualDetailsScreeen extends StatelessWidget {
  final String postId;
  const IndividualDetailsScreeen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Individual Details Screen: $postId",
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
    );
  }
}
