import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/constant/Config.dart';
import 'package:flutter_zhifu_ui/constant/Strings.dart';
import 'package:flutter_zhifu_ui/modules/article/ArticlePage.dart';
import 'package:flutter_zhifu_ui/modules/home/HomePage.dart';
import 'package:flutter_zhifu_ui/modules/index/NavigationIconView.dart';
import 'package:flutter_zhifu_ui/modules/knowledge/KnowledgePage.dart';
import 'package:flutter_zhifu_ui/modules/my/MyPage.dart';
import 'package:flutter_zhifu_ui/modules/notice/NoticePage.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  @override
  void initState() {
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
          icon: new Icon(Icons.home), title: new Text(Strings.INDEX_NAV_HOME), vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.bookmark),
          title: new Text(Strings.INDEX_NAV_ARTICLE),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.book),
          title: new Text(Strings.INDEX_NAV_KNOWLEDGE),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.notifications),
          title: new Text(Strings.INDEX_NAV_NOTICE),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.person),
          title: new Text(Strings.INDEX_NAV_MINE),
          vsync: this)
    ];

    for (NavigationIconView value in _navigationViews) {
      value.controller.addListener(_rebuild);
    }
    _pageList = <StatefulWidget>[
      new HomePage(),
      new ArticlePage(),
      new KnowledgePage(),
      new NoticePage(),
      new MyPage()
    ];
    _currentPage = _pageList[_currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: _navigationViews
            .map((NavigationIconView navigationIconView) =>
                navigationIconView.item)
            .toList(),
      currentIndex: _currentIndex,
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
          setState(() {
            _navigationViews[_currentIndex].controller.reverse();
            _currentIndex = index;
            _navigationViews[_currentIndex].controller.forward();
            _currentPage = _pageList[_currentIndex];
          });
      },
    );

    return new MaterialApp(
      home: new Scaffold(
        body: new Center(child: _currentPage,),
        bottomNavigationBar: bottomNavigationBar,
      ),
      theme: Config.themeData,
    );
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    for (var value in _navigationViews) {
      value.controller.dispose();
    }
    super.dispose();
  }
}
