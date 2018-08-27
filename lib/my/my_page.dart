import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/global_config.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyPage();
  }
}

class _MyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: GlobalConfig.themeData,
      home: new Scaffold(
        appBar: new AppBar(
          title: barSearch(),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            child: new Column(
              children: <Widget>[
                myInfoCard(),
                myServiceCard(),
                settingCard(),
                videoCard(),
                ideaCard()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget barSearch() {
    return new Container(
      child: new FlatButton(
          onPressed: () {},
          child: new Row(
            children: <Widget>[
              new Container(
                child: new Container(child: new Icon(Icons.search, size: 18.0)),
                margin: const EdgeInsets.only(right: 20.0),
              ),
              new Expanded(child: new Text("搜索知乎内容")),
              new Container(
                child: new FlatButton(
                    onPressed: () {},
                    child: new Icon(
                      Icons.settings_overscan,
                      size: 18.0,
                    )),
                width: 40.0,
              )
            ],
          )),
      decoration: new BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
          color: GlobalConfig.searchBackgroundColor),
    );
  }

  Widget myInfoCard() {
    return new Container(
      child: new Text("sfdsdf"),
    );
  }

  Widget myServiceCard() {
    return new Container(
      child: new Text("sfdsdf"),
    );
  }

  Widget settingCard() {
    return new Container(
      child: new Text("sfdsdf"),
    );
  }

  Widget videoCard() {
    return new Container(
      child: new Text("sfdsdf"),
    );
  }

  Widget ideaCard() {
    return new Container(
      child: new Text("sfdsdf"),
    );
  }
}
