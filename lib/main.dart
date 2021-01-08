import 'package:flutter/material.dart';
import 'package:herewego/pages/home_page.dart';
import 'package:herewego/pages/signin_page.dart';
import 'package:herewego/pages/sing_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SigInPage(),
      routes: {
          MyHomePage.id: (context)=>MyHomePage(),
        SigInPage.id: (context)=>SigInPage(),
        SigUpPage.id: (context)=>SigUpPage(),

        });
  }
}
