import 'package:flutter/material.dart';

class IdeaPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _IdeaPage();
  }
}

class _IdeaPage extends State<IdeaPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('想法'),
      ),
      body: new Center(
        child: new Text('想法页面'),
      ),
    );
  }
}