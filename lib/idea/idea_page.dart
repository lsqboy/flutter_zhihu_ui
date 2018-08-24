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
        title: new Text('Idea'),
      ),
      body: new Center(
        child: new Text('Idea Page'),
      ),
    );
  }
}