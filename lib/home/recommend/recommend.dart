import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/global_config.dart';
import 'package:flutter_zhifu_ui/home/detail/reply_page.dart';
import 'package:flutter_zhifu_ui/home/model/article.dart';
import 'package:flutter_zhifu_ui/home/model/question.dart';
import 'package:flutter_zhifu_ui/my/my_page.dart';

class Recommend extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Recommend();
  }
}

class _Recommend extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
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
                  .push(new MaterialPageRoute(builder: (context) {return new ReplyPage();}));
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

    return new SingleChildScrollView(
      child: new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: new Column(
          children: <Widget>[
            wordsCard(articleList[0]),
            wordsCard(articleList[1]),
          ],
        ),
      ),
    );
  }
}
