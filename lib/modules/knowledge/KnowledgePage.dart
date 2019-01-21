import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/constant/Strings.dart';
import 'package:flutter_zhifu_ui/constant/Urls.dart';
import 'package:flutter_zhifu_ui/event/EventObject.dart';
import 'package:flutter_zhifu_ui/event/EventUtils.dart';
import 'package:flutter_zhifu_ui/http/HttpUtils.dart';
import 'package:flutter_zhifu_ui/modules/knowledge/KnowledgeChildPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KnowledgePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _KnowledgePage();
  }
}

class _KnowledgePage extends State<KnowledgePage> with AutomaticKeepAliveClientMixin {
  /// 获取到的文章列表数据集合。给ListView构建Item时使用。
  List _treeData = List();

  /// 下拉刷新动作，这里需要看下文档
  Future<Null> _refresh() async {
    getTreeData();
    return null;
  }

  @override
  void initState() {
    // 监听 登录 成功和失败的事件
    EventUtils.appEvent.on<EventObject>().listen((event) {
      // 登录成功 这里要检查下挂载状态
      if (this.mounted) {
        if (event.key == EventUtils.EVENT_LOGIN) {
          // 登录成功  刷新下列表吧
          getTreeData();
          print("HomePage:EVENT_LOGIN");
        } else if (event.key == EventUtils.EVENT_LOGOUT) {
          // 退出登录  也刷新下列表吧  别想到其他的动作现在
          getTreeData();
          print("HomePage:EVENT_LOGOUT");
        }
      }
    });

    _refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(Strings.INDEX_NAV_KNOWLEDGE),
      ),
      body: _treeData.length == 0
          ? new Center(
              child: new CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation(Theme.of(context).primaryColor),
              ),
            )
          : new RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return getItemView(index);
                },
                itemCount: _treeData == null ? 0 : _treeData.length,
              ),
              onRefresh: _refresh),
    );
  }

  /// 生成 item widget
  getItemView(int index) {
    var item = _treeData[index];
    var children = item["children"];
    StringBuffer contentString = StringBuffer();
    for (var value in children) {
      contentString.write("${value['name']}   ");
    }

    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          /// 点击事件
//          Fluttertoast.showToast(
//              msg: "点击了${item["name"]}",
//              gravity: ToastGravity.CENTER,
//              bgcolor: "#99000000",
//              textcolor: '#ffffff');
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => KnowledgeChildPage(item)));
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        item["name"],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18.0, color: Theme.of(context).primaryColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          contentString.toString(),
                          softWrap: true,
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  )),
              Icon(Icons.navigate_next)
            ],
          ),
        ),
      ),
    );
  }

  /// 获取数据
  void getTreeData() {
    HttpUtils.get(Urls.TREE_DATA).then((response) {
//      print(response);
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> resultMap = jsonDecode(response);
        var datas = resultMap["data"];
        if (resultMap["errorCode"] == 0 && datas != null) {
          setState(() {
            _treeData = datas;
          });
        } else {
          // 弹出提示
          Fluttertoast.showToast(
              msg: "${resultMap["errorMsg"]}",
              gravity: ToastGravity.CENTER);
        }
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
