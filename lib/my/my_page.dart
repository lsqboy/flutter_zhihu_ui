import 'package:flutter/material.dart';

class MyPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _MyPage();
  }
}

class _MyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My'),
      ),
      body: new Center(
        child: new Text('My Page'),
      ),
    );
  }
}