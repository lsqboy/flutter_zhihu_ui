import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/global_config.dart';
import 'package:flutter_zhifu_ui/home/home_page.dart';
import 'package:flutter_zhifu_ui/idea/idea_page.dart';
import 'package:flutter_zhifu_ui/index/navigation_icon_view.dart';
import 'package:flutter_zhifu_ui/market/market_page.dart';
import 'package:flutter_zhifu_ui/my/my_page.dart';
import 'package:flutter_zhifu_ui/notice/notice_page.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _IndexState();
  }
}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  @override
  void initState() {
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
          icon: new Icon(Icons.assessment), title: new Text('首页'), vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.all_inclusive),
          title: new Text('想法'),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.add_shopping_cart),
          title: new Text('市场'),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.notifications),
          title: new Text('通知'),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.perm_identity),
          title: new Text('我的'),
          vsync: this)
    ];

    for (NavigationIconView value in _navigationViews) {
      value.controller.addListener(_rebuild);
    }
    _pageList = <StatefulWidget>[
      new HomePage(),
      new IdeaPage(),
      new MarketPage(),
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
      theme: GlobalConfig.themeData,
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
