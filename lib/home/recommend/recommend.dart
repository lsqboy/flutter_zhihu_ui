import 'package:flutter/material.dart';

class Recommend extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Recommend();
  }
}

class _Recommend extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: new Column(
          children: <Widget>[
            new Text('Recommend1'),
            new Container(margin: const EdgeInsets.only(top: 20.0),),
            new Text('Recommend2'),
            new Container(margin: const EdgeInsets.only(top: 20.0),),
            new Text('Recommend3'),
            new Container(margin: const EdgeInsets.only(top: 20.0),),
          ],
        ),
      ),
    );
  }
}
