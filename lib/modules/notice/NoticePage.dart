import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zhifu_ui/constant/Strings.dart';

class NoticePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _NoticePage();
  }
}

class _NoticePage extends State<NoticePage> {
  static const platform = const MethodChannel("com.zteman.test/android");
  static const EventChannel eventChannel =
      const EventChannel('com.zteman.test/netChanged');
  var netChangeStr = "点我获取当前网络状态";

  showToast(String msg) async {
    try {
      await platform.invokeMethod("showToast", {"msg": msg});
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  callPhone(String msg) async {
    try {
      await platform.invokeMethod("callPhone", {"msg": msg});
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  Future<String> getAndroidTime() async {
    var str;
    try {
      str = await platform.invokeMethod("getAndroidTime");
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return str;
  }

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object event) {
    setState(() {
      netChangeStr = event;
    });
  }

  void _onError(Object error) {
    setState(() {
      netChangeStr = "网络状态获取失败";
    });
  }

  Future<bool> isNetConnection() async {
    bool isConnection;
    try {
      isConnection = await platform.invokeMethod("netConnection");
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return isConnection;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text(Strings.INDEX_NAV_NOTICE),
        ),
        body: new Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20.0),
          child: new Column(
            children: <Widget>[
              new RaisedButton(
                child: Text("点我提示"),
                onPressed: () {
                  showToast("我是android系统的toast");
                },
              ),
              new Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: new RaisedButton(
                  child: Text("点我拨打电话"),
                  onPressed: () {
                    callPhone("10086");
                  },
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: new RaisedButton(
                  child: Text("点我获取Android平台数据"),
                  onPressed: () {
                    getAndroidTime().then((str) {
                      Scaffold.of(context).showSnackBar(new SnackBar(
                          content: Text(str != null ? str : "获取失败")));
                    });
                  },
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: new RaisedButton(
                  child: Text(netChangeStr),
                  onPressed: () {
                    isNetConnection().then((bool) {
                      showToast(bool ? "网络连接成功" : "网络连接失败");
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
