import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/constant/global_config.dart';
import 'package:flutter_zhifu_ui/modules/home/follow/follow.dart';
import 'package:flutter_zhifu_ui/modules/home/hot/hot.dart';
import 'package:flutter_zhifu_ui/modules/home/recommend/recommend.dart';
import 'package:flutter_zhifu_ui/modules/home/search/search_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget barSearch() {
      return new Container(
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: new FlatButton.icon(
                    onPressed: (){
                      Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                        return new SearchPage();
                      }));
                    },
                    icon: new Icon(
                      Icons.search,
                      color: GlobalConfig.fontColor,
                      size: 16.0,
                    ),
                    label: new Text(
                      "坚果R1摄像头损坏",
                      style: new TextStyle(color: GlobalConfig.fontColor),
                    ))),
            new Container(
              decoration: new BoxDecoration(
                  border: new BorderDirectional(
                      start: new BorderSide(
                          color: GlobalConfig.fontColor, width: 1.0))),
              height: 14.0,
              width: 1.0,
            ),
            new Container(
              child: new FlatButton.icon(
                  onPressed: (){
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                      return new SearchPage();
                    }));
                  },
                  icon: new Icon(
                    Icons.border_color,
                    color: GlobalConfig.fontColor,
                    size: 14.0,
                  ),
                  label: new Text(
                    "提问",
                    style: new TextStyle(color: GlobalConfig.fontColor),
                  )),
            ),
          ],
        ),
        decoration: new BoxDecoration(
            borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
            color: GlobalConfig.searchBackgroundColor),
      );
    }

    return new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            title: barSearch(),
            bottom: new TabBar(
              tabs: [
                new Tab(text: '关注'),
                new Tab(text: '推荐'),
                new Tab(text: '热榜'),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
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
