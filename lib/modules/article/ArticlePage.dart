import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:banner_view/banner_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_zhifu_ui/constant/Urls.dart';
import 'package:flutter_zhifu_ui/event/EventObject.dart';
import 'package:flutter_zhifu_ui/event/EventUtils.dart';
import 'package:flutter_zhifu_ui/http/HttpUtils.dart';
import 'package:flutter_zhifu_ui/modules/article/WebDetailPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ArticlePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ArticlePage();
  }
}

class _ArticlePage extends State<ArticlePage> with AutomaticKeepAliveClientMixin{
  /// 列表用的滑动监听控制器。这里可以点进去看看它里面有哪些参数和方法。
  ScrollController _scrollController = ScrollController();

  /// 给Snack用的。
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  /// banner的数据。
  var _bannerData;
  List<Widget> _bannerWidget = new List();
  Widget _banner;

  /// 获取到的文章列表数据集合。给ListView构建Item时使用。
  List _articleData = List();

  /// 文章总条数，用来做加载更多的判断用的。
  var _totalCount;

  /// 当前的页面，这个接口是从0开始的。
  var _curPager = 0;

  /// 标志当前在请求中。
  var _isRequesting = false;

  /// 下拉刷新动作，这里需要看下文档
  Future<Null> _refresh() async {
    getBannerData();
    getArticleData(false);
    return null;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // 加载更多
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
              _scrollController.position.pixels &&
          _articleData.length < _totalCount &&
          !_isRequesting) {
        // 这个时候触发加载更多
        getArticleData(true);
      }
    });

    EventUtils.appEvent.on<EventObject>().listen((event){
      if (this.mounted) {
        if (event.key == EventUtils.EVENT_LOGIN) {
          // 登录成功  刷新下列表吧
          getArticleData(false);
          print("玩资讯：登录成功");
        }else if(event.key == EventUtils.EVENT_LOGOUT){
          // 退出登录  也刷新下列表吧  别想到其他的动作现在
          getArticleData(false);
          print("玩资讯：退出登录成功");
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
        title: new Text('玩资讯'),
      ),
      key: _scaffoldState,
      body: _articleData.length == 0
          ? Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation(Theme.of(context).primaryColor),
              ),
            )
          : RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (context, index) => getListViewItemWidget(index),
                itemCount: _articleData.length + 1,
                controller: _scrollController,
              ),
              onRefresh: _refresh),
    );
  }

  void getBannerData() {
    HttpUtils.get(Urls.HOME_BANNER_DATA).then((response) {
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> resultMap = jsonDecode(response);
        var data = resultMap["data"];
        if (data != null && resultMap["errorCode"] == 0) {
          setState(() {
            _bannerData = data;
            for (var value in _bannerData) {
              _bannerWidget.add(new Container(
                child: new GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                      return WebDetailPage(value["title"],value["url"]);
                    }));
                  },
                  child: CachedNetworkImage(
                    imageUrl: value["imagePath"],
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                )
              ));
            }
            _banner = new Container(
              alignment: Alignment.center,
              height: 200.0,
              child: new BannerView(
                _bannerWidget,
                intervalDuration: new Duration(seconds: 5),
              ),
            );
          });
        }
      }
    });
  }

  /// 构建 item
  getListViewItemWidget(int index) {
    if (index == 0) {
      // 这个是banner
      return _banner;
    }
    var item = _articleData[index - 1];
    // 其他的是列表的数据了。 这样写的好难看，看来得把代码多的这些部分移动到另一个文件去写了。
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 2.0,
      // 水波
      child: InkWell(
        onTap: () {
          /// 点击事件
//          Fluttertoast.showToast(
//              msg: "点击了${item["title"]}",
//              gravity: ToastGravity.CENTER,
//              bgcolor: "#99000000",
//              textcolor: '#ffffff');
          // 打开web页面
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  WebDetailPage(item["title"], item["link"])));
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              /// 作者 和 时间 在一行
              Row(
                children: <Widget>[
                  // 作者
                  Expanded(
                    child: Text(
                      item["author"],
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                    ),
                  ),
                  //时间
                  Text(
                    item["niceDate"],
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),

              /// 标题   描述有的是空的，就不放上来了。
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      // 设置支持软换行的
                      child: Text(
                        item["title"],
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),

              /// 分类   和   点星(收藏)
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    item["superChapterName"],
                    style: TextStyle(color: Colors.green, fontSize: 16.0),
                  )),
                  // 小星星
                  GestureDetector(
                    onTap: () {
                      Scaffold
                          .of(context)
                          .showSnackBar(SnackBar(content: Text("收藏我哦")));
                      // 收藏或者取消收藏
//                      dealWithArticleCollectStatus(index - 1, item["collect"]);
                    },
                    child: Image.asset(
                      item["collect"]
                          ? "images/icon_collect_yes.png"
                          : "images/icon_collect_no.png",
                      width: 25.0,
                      height: 25.0,
                    ),
                  )
                ],
              )
              //
            ],
          ),
        ),
      ),
    );
  }

  /// 获取文章列表的数据
  void getArticleData(bool isLoadMore) {
    // 根据当前需要加载的页码来加载。这个页码在每次加载更多成功后+1就好了，下拉刷新的时候重置为0
    if (!isLoadMore) {
      _curPager = 0;
    }
    // 拼接url
    var articleUrl = "${Urls.ARTICLE_LIST}$_curPager/json";
    // 开始请求  来一个请求中的值吧。
    setState(() {
      _isRequesting = true;
    });
    HttpUtils.get(articleUrl).then((response) {
      // 请求完成后设置这个值的状态
      _isRequesting = false;
      // 拿到结果后解析数据吧。
//      print(response);
      if (response != null && response.isNotEmpty) {
        // 这里用到dart:convert这个转换库
        Map<String, dynamic> resultMap = jsonDecode(response);
        // 判断成功取到了列表数据没有 errorCode==0 && data 有数据就正确，不然弹出errorMsg
        var data = resultMap["data"];
        if (data != null && resultMap["errorCode"] == 0) {
          // 要使状态发生改变
          setState(() {
            /// 这些是文章列表的数据
            // 总数
            _totalCount = data["total"];
            // 要加的列表数据
            if (!isLoadMore) {
              _articleData = data["datas"];
            } else {
              _articleData.addAll(data["datas"]);
            }
            // 这个时候mPager++
            _curPager++;
          });
          // 如果是加载成功再提示一下吧。
          if (isLoadMore) {
            _scaffoldState.currentState.showSnackBar(
                SnackBar(content: Text("新增了${data["datas"].length}条数据")));
          }
        } else {
          // 弹出提示
          Fluttertoast.showToast(
              msg: "${resultMap["errorMsg"]}",
              gravity: ToastGravity.CENTER,
              bgcolor: "#99000000",
              textcolor: '#ffffff');
        }
      }
    });
  }
}
