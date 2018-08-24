import 'package:flutter/material.dart';

class Hot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Hot();
  }
}

class _Hot extends State<Hot> {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: new Column(
          children: <Widget>[
            new Text('hot1'),
            new Container(margin: const EdgeInsets.only(top: 20.0),),
            new Text('hot2'),
            new Container(margin: const EdgeInsets.only(top: 20.0),),
            new Text('hot3'),
            new Container(margin: const EdgeInsets.only(top: 20.0),),
          ],
        ),
      ),
    );
  }
}
