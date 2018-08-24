import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/global_config.dart';
import 'package:flutter_zhifu_ui/home/hot/hot.dart';
import 'package:flutter_zhifu_ui/home/model/article.dart';
import 'package:flutter_zhifu_ui/my/my_page.dart';

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
        margin: const EdgeInsets.only(top: 5.0),
        child: new Column(
          children: <Widget>[
            wordsCard(articleList[0]),
            wordsCard(articleList[1]),
            wordsCard(articleList[2]),
            billboard(),
            wordsCard(articleList[3]),
          ],
        ),
      ),
    );
  }
  Widget billboard() {
    return new Container(
        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        color: GlobalConfig.cardBackgroundColor,
        child: new FlatButton(
          onPressed: (){},
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new CircleAvatar(
                          backgroundImage: new NetworkImage("https://pic1.zhimg.com/50/v2-0c9de2012cc4c5e8b01657d96da35534_s.jpg"),
                          radius: 11.0
                      ),
                    ),
                    new Text("  对啊网", style: new TextStyle(color: GlobalConfig.fontColor))
                  ],
                ),
                padding: const EdgeInsets.only(top: 10.0),
              ),
              new Container(
                  child: new Text(
                      "考过CPA，非名牌大学也能进名企",
                      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, height: 1.3, color: GlobalConfig.dark == true? Colors.white70 : Colors.black)
                  ),
                  margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                  alignment: Alignment.topLeft
              ),
              new Container(
                  child: new AspectRatio(
                      aspectRatio: 3.0 / 1.0,
                      child:new Container(
                        foregroundDecoration:new BoxDecoration(
                            image: new DecorationImage(
                              image: new NetworkImage("https://pic2.zhimg.com/50/v2-6416ef6d3181117a0177275286fac8f3_hd.jpg"),
                              centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                            ),
                            borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                        ),
                      )
                  ),
                  margin: new EdgeInsets.only(top: 6.0, bottom: 14.0),
                  alignment: Alignment.topLeft
              ),
              new Container(
                  child: new Text(
                      "还在羡慕别人的好工作？免费领取价值1980元的注册会计师课程，为自己充电！",
                      style: new TextStyle(height: 1.3, color: GlobalConfig.fontColor)
                  ),
                  padding: const EdgeInsets.only(bottom: 8.0)
              ),

              new Container(
                child: new Row(
                  children: <Widget>[
                    new Container(
                        child: new Text("广告", style: new TextStyle(fontSize: 10.0, color: GlobalConfig.fontColor)),
                        decoration: new BoxDecoration(
                          border: new Border.all(color: GlobalConfig.fontColor),
                          borderRadius: new BorderRadius.all(const Radius.circular(2.0)),
                        ),
                        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 3.0, right: 3.0)
                    ),
                    new Expanded(
                        child: new Text("  查看详情", style: new TextStyle(color: GlobalConfig.fontColor))
                    ),
                    new Icon(Icons.clear, color: GlobalConfig.fontColor)
                  ],
                ),
                padding: const EdgeInsets.only(bottom: 10.0),
              )
            ],
          ),
        )
    );
  }
  Widget wordsCard(Article article) {
    Widget markWidget;
    if (article.imgUrl == null) {
      markWidget = new Text(
        article.mark,
        style: new TextStyle(height: 1.3, color: GlobalConfig.fontColor),
      );
    } else {
      markWidget = new Row(
        children: <Widget>[
          new Expanded(
            child: new Container(
              child: new Text(
                article.title,
                style:
                    new TextStyle(height: 1.3, color: GlobalConfig.fontColor),
              ),
            ),
            flex: 2,
          ),
          new Expanded(
              child: new AspectRatio(
                aspectRatio: 3.0 / 2.0,
                child: new Container(
                  foregroundDecoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new NetworkImage(article.imgUrl),
                          centerSlice:
                              new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0)),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(6.0))),
                ),
              ),
              flex: 1)
        ],
      );
    }
    return new Container(
      color: GlobalConfig.cardBackgroundColor,
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: new FlatButton(
          onPressed: () {
            Navigator
                .of(context)
                .push(new MaterialPageRoute(builder: (context) {return new MyPage();}));
          },
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new CircleAvatar(
                        backgroundImage: new NetworkImage(article.headUrl),
                        radius: 11.0,
                      ),
                    ),
                    new Text(
                      "  " +
                          article.user +
                          " " +
                          article.action +
                          " · " +
                          article.time,
                      style: new TextStyle(color: GlobalConfig.fontColor),
                    )
                  ],
                ),
                padding: const EdgeInsets.only(top: 10.0),
              ),
              new Container(
                child: new Text(
                  article.title,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      height: 1.3,
                      color: GlobalConfig.dark == true
                          ? Colors.white70
                          : Colors.black),
                ),
                margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                alignment: Alignment.topLeft,
              ),
              new Container(
                child: markWidget,
                margin: new EdgeInsets.only(top: 6.0),
                alignment: Alignment.topLeft,
              ),
              new Container(
                  child: new Row(
                children: <Widget>[
                  new Expanded(
                      child: new Text(
                          article.agreeNum.toString() +
                              " 赞同 · " +
                              article.commentNum.toString() +
                              "评论",
                          style: new TextStyle(color: GlobalConfig.fontColor))),
                  new PopupMenuButton(
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<String>>[
                            new PopupMenuItem<String>(
                              child: new Text('屏蔽这个问题'),
                              value: '选项一的值',
                            ),
                            new PopupMenuItem<String>(
                              child: new Text('取消关注 learner'),
                              value: '选项二的值',
                            ),
                            new PopupMenuItem<String>(
                              child: new Text('举报'),
                              value: '选项三的值',
                            ),
                          ])
                ],
              )),
            ],
          )),
    );
  }
}
