import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  static final String id="home_page";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: FlatButton(
          color: Colors.red,
          onPressed: (){},
          child: Text("LogOut"),
        ),
      ),
    );
  }
}
