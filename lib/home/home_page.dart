import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/home/follow/follow.dart';
import 'package:flutter_zhifu_ui/home/hot/hot.dart';
import 'package:flutter_zhifu_ui/home/recommend/recommend.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('Home'),
            bottom: new TabBar(
              tabs: [
                new Tab(text: '关注'),
                new Tab(text: '推荐'),
                new Tab(text: '热榜'),
              ],
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
            ),
          ),
          body: new TabBarView(children: [
            new Follow(),
            new Recommend(),
            new Hot(),
          ]),
        ));
  }
}
