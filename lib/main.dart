import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/constant/AppConstant.dart';
import 'package:flutter_zhifu_ui/constant/Config.dart';
import 'package:flutter_zhifu_ui/modules/index/IndexPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.getInstance().then((prefs) {
    AppConstant.APP_COOKIE = prefs.getString(Config.SP_COOKIE);
  });
  runApp(new Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "知乎玩安卓",
      home: new IndexPage(),
    );
  }
}
