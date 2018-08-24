import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _NoticePage();
  }
}

class _NoticePage extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Notice'),
      ),
      body: new Center(
        child: new Text('Notice Page'),
      ),
    );
  }
}