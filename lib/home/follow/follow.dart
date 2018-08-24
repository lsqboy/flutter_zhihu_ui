import 'package:flutter/material.dart';

class Follow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Follow();
  }
}

class _Follow extends State<Follow> {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: new Column(
          children: <Widget>[
            new Text('Follow1'),
            new Container(margin: const EdgeInsets.only(top: 20.0),),
            new Text('Follow2'),
            new Container(margin: const EdgeInsets.only(top: 20.0),),
            new Text('Follow3'),
            new Container(margin: const EdgeInsets.only(top: 20.0),),
          ],
        ),
      ),
    );
  }
}
