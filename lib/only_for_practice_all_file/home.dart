import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "This polder only for practice",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.greenAccent,
                Colors.brown,
                Colors.lime,
                Colors.yellowAccent,
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, builder) {
        return ListTile(title: Text("name"),
          subtitle: Text("Subtitle"),
          leading: Icon(Icons.person),);
      }),

    );
  }
}
