import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/constant/Config.dart';

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
      theme: Config.themeData,
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
          color: Config.searchBackgroundColor),
    );
  }

  Widget myInfoCard() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new FlatButton(
                onPressed: () {},
                child: new Container(
                  child: new ListTile(
                    title: new Text("learner"),
                    subtitle: new Text("查看或编辑个人主页"),
                    leading: new CircleAvatar(
                      backgroundImage: new NetworkImage(
                          "https://pic1.zhimg.com/v2-ec7ed574da66e1b495fcad2cc3d71cb9_xl.jpg"),
                      radius: 20.0,
                    ),
                  ),
                )),
            decoration: new BoxDecoration(
                color: new Color(0xFFF5F5F5),
                borderRadius: new BorderRadius.all(const Radius.circular(6.0))),
            margin:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          ),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: null,
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                "57",
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Config.fontColor),
                              ),
                            ),
                            new Container(
                              child: new Text(
                                "我的创作",
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: Config.fontColor),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  width: 1.0,
                  height: 14.0,
                  decoration: new BoxDecoration(
//                    color: Colors.black12,
                      border: new BorderDirectional(
                          start: new BorderSide(
                              color: Colors.black12, width: 1.0))),
                ),
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: null,
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                "210",
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Config.fontColor),
                              ),
                            ),
                            new Container(
                              child: new Text(
                                "关注",
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: Config.fontColor),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  width: 1.0,
                  height: 14.0,
                  decoration: new BoxDecoration(
//                    color: Colors.black12,
                      border: new BorderDirectional(
                          start: new BorderSide(
                              color: Colors.black12, width: 1.0))),
                ),
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: null,
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                "18",
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Config.fontColor),
                              ),
                            ),
                            new Container(
                              child: new Text(
                                "我的收藏",
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: Config.fontColor),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  width: 1.0,
                  height: 14.0,
                  decoration: new BoxDecoration(
//                    color: Colors.black12,
                      border: new BorderDirectional(
                          start: new BorderSide(
                              color: Colors.black12, width: 1.0))),
                ),
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: null,
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                "33",
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Config.fontColor),
                              ),
                            ),
                            new Container(
                              child: new Text(
                                "最近浏览",
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: Config.fontColor),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
      color: Config.cardBackgroundColor,
      margin: const EdgeInsets.only(top: 10.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
    );
  }

  Widget myServiceCard() {
    return new Container(
      color: Config.cardBackgroundColor,
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.green,
                                child: new Icon(
                                  Icons.book,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            new Container(
                              margin: const EdgeInsets.only(top: 6.0),
                              child: new Text(
                                "我的书架",
                                style: new TextStyle(
                                    color: Config.fontColor,
                                    fontSize: 14.0),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.blue,
                                child: new Icon(
                                  Icons.flash_on,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            new Container(
                              margin: const EdgeInsets.only(top: 6.0),
                              child: new Text(
                                "我的live",
                                style: new TextStyle(
                                    color: Config.fontColor,
                                    fontSize: 14.0),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new CircleAvatar(
                                radius: 20.0,
                                backgroundColor: new Color(0xFFA68F52),
                                child: new Icon(
                                  Icons.free_breakfast,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            new Container(
                              margin: const EdgeInsets.only(top: 6.0),
                              child: new Text(
                                "私家课",
                                style: new TextStyle(
                                    color: Config.fontColor,
                                    fontSize: 14.0),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new CircleAvatar(
                                radius: 20.0,
                                backgroundColor: new Color(0xFF355A9B),
                                child: new Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            new Container(
                              margin: const EdgeInsets.only(top: 6.0),
                              child: new Text(
                                "付费咨询",
                                style: new TextStyle(
                                    color: Config.fontColor,
                                    fontSize: 14.0),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new CircleAvatar(
                                radius: 20.0,
                                backgroundColor: new Color(0xFF088DB4),
                                child: new Icon(
                                  Icons.shop,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            new Container(
                              margin: const EdgeInsets.only(top: 6.0),
                              child: new Text(
                                "已购",
                                style: new TextStyle(
                                    color: Config.fontColor,
                                    fontSize: 14.0),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.blue,
                                child: new Icon(
                                  Icons.radio,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            new Container(
                              margin: const EdgeInsets.only(top: 6.0),
                              child: new Text(
                                "余额礼券",
                                style: new TextStyle(
                                    color: Config.fontColor,
                                    fontSize: 14.0),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new CircleAvatar(
                                radius: 20.0,
                                backgroundColor: new Color(0xFF029A3F),
                                child: new Icon(
                                  Icons.wifi_tethering,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            new Container(
                              margin: const EdgeInsets.only(top: 6.0),
                              child: new Text(
                                "服务",
                                style: new TextStyle(
                                    color: Config.fontColor,
                                    fontSize: 14.0),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
            margin: const EdgeInsets.only(top: 12.0),
          ),
        ],
      ),
    );
  }

  Widget settingCard() {
    return new Container(
      margin: const EdgeInsets.only(top: 6.0, bottom: 8.0),
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      decoration: new BoxDecoration(
        color: Config.cardBackgroundColor,
      ),
      child: new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              width: MediaQuery.of(context).size.width / 4,
              child: new FlatButton(
                  onPressed: () {},
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new CircleAvatar(
                            radius: 20.0,
                            backgroundColor: new Color(0xFFB88800),
                            child: new Icon(
                              Icons.invert_colors,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(top: 6.0),
                          child: new Text(
                            "社区建设",
                            style: new TextStyle(
                                color: Config.fontColor, fontSize: 14.0),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            new Container(
              width: MediaQuery.of(context).size.width / 4,
              child: new FlatButton(
                  onPressed: () {},
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new CircleAvatar(
                            radius: 20.0,
                            backgroundColor: new Color(0xFF63616D),
                            child: new Icon(
                              Icons.golf_course,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(top: 6.0),
                          child: new Text(
                            "反馈",
                            style: new TextStyle(
                                color: Config.fontColor, fontSize: 14.0),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            new Container(
              width: MediaQuery.of(context).size.width / 4,
              child: new FlatButton(
                  onPressed: () {},
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new CircleAvatar(
                            radius: 20.0,
                            backgroundColor: new Color(0xFFB86A0D),
                            child: new Icon(
                              Icons.wb_sunny,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(top: 6.0),
                          child: new Text(
                            "日间模式",
                            style: new TextStyle(
                                color: Config.fontColor, fontSize: 14.0),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            new Container(
              width: MediaQuery.of(context).size.width / 4,
              child: new FlatButton(
                  onPressed: () {},
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new CircleAvatar(
                            radius: 20.0,
                            backgroundColor: new Color(0xFF636269),
                            child: new Icon(
                              Icons.perm_data_setting,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(top: 6.0),
                          child: new Text(
                            "设置",
                            style: new TextStyle(
                                color: Config.fontColor, fontSize: 14.0),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget videoCard() {
    return new Container(
      color: Config.cardBackgroundColor,
      margin: const EdgeInsets.only(top: 6.0, bottom: 8.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 16.0),
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: new CircleAvatar(
                  radius: 20.0,
                  child: new Icon(Icons.videocam, color: Colors.white),
                  backgroundColor: new Color(0xFFB36905),
                ),
              ),
              new Expanded(
                  child: new Text(
                "视频创作",
                style: new TextStyle(color: Colors.black, fontSize: 18.0),
              )),
              new Container(
                child: new FlatButton(
                    onPressed: (){},
                    child: new Text("拍一个", style: new TextStyle(color: Colors.blue),)
                ),
              )
            ],
          ),
          new Container(
            margin: const EdgeInsets.only(left: 16.0,top: 16.0),
              child: new SingleChildScrollView(
                scrollDirection: Axis.horizontal,
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new AspectRatio(
                    aspectRatio: 4.0 / 2.0,
                    child: new Container(
                      foregroundDecoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new NetworkImage(
                                "https://pic2.zhimg.com/50/v2-5942a51e6b834f10074f8d50be5bbd4d_400x224.jpg"),
                            centerSlice:
                                new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0)),
                        borderRadius: const BorderRadius.all(const Radius.circular(6.0)),
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width / 2.5,
                  margin: const EdgeInsets.only(right: 6.0),
                ),
                new Container(
                  child: new AspectRatio(
                    aspectRatio: 4.0 / 2.0,
                    child: new Container(
                      foregroundDecoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new NetworkImage(
                                "https://pic3.zhimg.com/50/v2-7fc9a1572c6fc72a3dea0b73a9be36e7_400x224.jpg"),
                            centerSlice:
                            new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0)),
                        borderRadius: const BorderRadius.all(const Radius.circular(6.0)),
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width / 2.5,
                  margin: const EdgeInsets.only(right: 6.0),
                ),
                new Container(
                  child: new AspectRatio(
                    aspectRatio: 4.0 / 2.0,
                    child: new Container(
                      foregroundDecoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new NetworkImage(
                                "https://pic4.zhimg.com/50/v2-898f43a488b606061c877ac2a471e221_400x224.jpg"),
                            centerSlice:
                            new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0)),
                        borderRadius: const BorderRadius.all(const Radius.circular(6.0)),
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width / 2.5,
                  margin: const EdgeInsets.only(right: 6.0),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget ideaCard() {
    return new Container(
        color: Config.cardBackgroundColor,
        margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
        child: new Column(
          children: <Widget>[
            new Container(
                margin: const EdgeInsets.only(left: 16.0, bottom: 20.0),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new CircleAvatar(
                        radius: 20.0,
                        child: new Icon(Icons.all_inclusive, color: Colors.white),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: new Text("想法", style: new TextStyle(fontSize: 18.0),),
                      ),
                    ),
                    new Container(
                      child: new FlatButton(
                          onPressed: (){},
                          child: new Text("去往想法首页", style: new TextStyle(color: Colors.blue),)
                      ),
                    )
                  ],
                )
            ),
            new Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: new SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: new Row(
                  children: <Widget>[
                    new Container(
                        margin: const EdgeInsets.only(right: 6.0),
                        decoration: new BoxDecoration(
                            color: Config.searchBackgroundColor,
                            borderRadius: new BorderRadius.all(new Radius.circular(6.0))
                        ),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: new Column(
                                children: <Widget>[
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Container(
                                      child: new Text("苹果 WWDC 2018 正在举行", style: new TextStyle(color: Config.dark == true? Colors.white70 : Colors.black, fontSize: 16.0),),
                                    ),
                                  ),
                                  new Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Container(
                                        margin: const EdgeInsets.only(top: 6.0),
                                        child: new Text("软件更新意料之中，硬件之谜...", style: new TextStyle(color: Config.fontColor),),
                                      )
                                  )

                                ],
                              ),
                            ),
                            new Container(
                                margin: const EdgeInsets.all(10.0),
                                width: MediaQuery.of(context).size.width / 5,
                                child: new AspectRatio(
                                    aspectRatio: 1.0 / 1.0,
                                    child: new Container(
                                      foregroundDecoration:new BoxDecoration(
                                          image: new DecorationImage(
                                            image: new NetworkImage("https://pic2.zhimg.com/50/v2-55039fa535f3fe06365c0fcdaa9e3847_400x224.jpg"),
                                            centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                          ),
                                          borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                                      ),
                                    )
                                )
                            )
                          ],
                        )
                    ),
                    new Container(
                        margin: const EdgeInsets.only(right: 6.0),
                        decoration: new BoxDecoration(
                            color: Config.searchBackgroundColor,
                            borderRadius: new BorderRadius.all(new Radius.circular(6.0))
                        ),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: new Column(
                                children: <Widget>[
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Container(
                                      child: new Text("此刻你的桌子是什么样子？", style: new TextStyle(color: Config.dark == true? Colors.white70 : Colors.black, fontSize: 16.0),),
                                    ),
                                  ),
                                  new Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Container(
                                        margin: const EdgeInsets.only(top: 6.0),
                                        child: new Text("晒一晒你的书桌/办公桌", style: new TextStyle(color: Config.fontColor),),
                                      )
                                  )

                                ],
                              ),
                            ),
                            new Container(
                                margin: const EdgeInsets.all(10.0),
                                width: MediaQuery.of(context).size.width / 5,
                                child: new AspectRatio(
                                    aspectRatio: 1.0 / 1.0,
                                    child: new Container(
                                      foregroundDecoration:new BoxDecoration(
                                          image: new DecorationImage(
                                            image: new NetworkImage("https://pic3.zhimg.com/v2-b4551f702970ff37709cdd7fd884de5e_294x245|adx4.png"),
                                            centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                          ),
                                          borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                                      ),
                                    )
                                )
                            )
                          ],
                        )
                    ),
                    new Container(
                        margin: const EdgeInsets.only(right: 6.0),
                        decoration: new BoxDecoration(
                            color: Config.searchBackgroundColor,
                            borderRadius: new BorderRadius.all(new Radius.circular(6.0))
                        ),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: new Column(
                                children: <Widget>[
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Container(
                                      child: new Text("关于高考你印象最深的是...", style: new TextStyle(color: Config.dark == true? Colors.white70 : Colors.black, fontSize: 16.0),),
                                    ),
                                  ),
                                  new Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Container(
                                        margin: const EdgeInsets.only(top: 6.0),
                                        child: new Text("聊聊你的高三生活", style: new TextStyle(color: Config.fontColor),),
                                      )
                                  )

                                ],
                              ),
                            ),
                            new Container(
                                margin: const EdgeInsets.all(10.0),
                                width: MediaQuery.of(context).size.width / 5,
                                child: new AspectRatio(
                                    aspectRatio: 1.0 / 1.0,
                                    child: new Container(
                                      foregroundDecoration:new BoxDecoration(
                                          image: new DecorationImage(
                                            image: new NetworkImage("https://pic2.zhimg.com/50/v2-ce2e01a047e4aba9bfabf8469cfd3e75_400x224.jpg"),
                                            centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                          ),
                                          borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                                      ),
                                    )
                                )
                            )
                          ],
                        )
                    ),
                    new Container(
                        margin: const EdgeInsets.only(right: 6.0),
                        decoration: new BoxDecoration(
                            color: Config.searchBackgroundColor,
                            borderRadius: new BorderRadius.all(new Radius.circular(6.0))
                        ),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: new Column(
                                children: <Widget>[
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Container(
                                      child: new Text("夏天一定要吃的食物有哪些", style: new TextStyle(color: Config.dark == true? Colors.white70 : Colors.black, fontSize: 16.0),),
                                    ),
                                  ),
                                  new Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Container(
                                        margin: const EdgeInsets.only(top: 6.0),
                                        child: new Text("最适合夏天吃的那种", style: new TextStyle(color: Config.fontColor),),
                                      )
                                  )

                                ],
                              ),
                            ),
                            new Container(
                                margin: const EdgeInsets.all(10.0),
                                width: MediaQuery.of(context).size.width / 5,
                                child: new AspectRatio(
                                    aspectRatio: 1.0 / 1.0,
                                    child: new Container(
                                      foregroundDecoration:new BoxDecoration(
                                          image: new DecorationImage(
                                            image: new NetworkImage("https://pic1.zhimg.com/50/v2-bb3806c2ced60e5b7f38a0aa06b89511_400x224.jpg"),
                                            centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                          ),
                                          borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                                      ),
                                    )
                                )
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
