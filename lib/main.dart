import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/index/index.dart';

void main() => runApp(new ZhiHu());

class ZhiHu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '知乎-高仿版',
      home: new Index(),
    );
  }
}

