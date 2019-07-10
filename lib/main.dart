import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go_me/ApplicationPage.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "英雄联盟",
      home: Scaffold(body: new ApplicationPage()),
    );
  }
}
