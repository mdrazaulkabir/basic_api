import 'package:basic_api/factoryMethodUsed/allCodebyFactoryMethod.dart';
import 'package:basic_api/get_post_allOne_folder/view_screen/profile_screen.dart';
import 'package:basic_api/only_for_practice_all_file/post_all_here/post_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PostScreen(
      ),
    );
  }
}

