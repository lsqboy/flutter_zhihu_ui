import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/constant/Strings.dart';

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
        centerTitle: true,
        title: new Text(Strings.INDEX_NAV_NOTICE),
      ),
      body: new Center(
        child: new Text('通知页面'),
      ),
    );
  }
}