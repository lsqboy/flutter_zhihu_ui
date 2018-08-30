import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/constant/Config.dart';
import 'package:flutter_zhifu_ui/constant/Strings.dart';
import 'package:flutter_zhifu_ui/modules/home/follow/FollowPage.dart';
import 'package:flutter_zhifu_ui/modules/home/hot/HotPage.dart';
import 'package:flutter_zhifu_ui/modules/home/recommend/RecommendPage.dart';
import 'package:flutter_zhifu_ui/modules/home/search/SearchPage.dart';

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
                      color: Config.fontColor,
                      size: 16.0,
                    ),
                    label: new Text(
                      "坚果R1摄像头损坏",
                      style: new TextStyle(color: Config.fontColor),
                    ))),
            new Container(
              decoration: new BoxDecoration(
                  border: new BorderDirectional(
                      start: new BorderSide(
                          color: Config.fontColor, width: 1.0))),
              height: 14.0,
              width: 1.0,
            ),
            new Container(
              child: new FlatButton.icon(
                  onPressed: (){
//                    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
//                      return new SearchPage();
//                    }));
                  },
                  icon: new Icon(
                    Icons.border_color,
                    color: Config.fontColor,
                    size: 14.0,
                  ),
                  label: new Text(
                    "提问",
                    style: new TextStyle(color: Config.fontColor),
                  )),
            ),
          ],
        ),
        decoration: new BoxDecoration(
            borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
            color: Config.searchBackgroundColor),
      );
    }

    return new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            title: barSearch(),
            bottom: new TabBar(
              tabs: [
                new Tab(text: Strings.HOME_NAV_FOLLOW),
                new Tab(text: Strings.HOME_NAV_RECOMMEND),
                new Tab(text: Strings.HOME_NAV_HOT),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
            ),
          ),
          body: new TabBarView(children: [
            new FollowPage(),
            new RecommendPage(),
            new HotPage(),
          ]),
        ));
  }
}
