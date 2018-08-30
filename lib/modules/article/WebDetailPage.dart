import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/// web页面。
class WebDetailPage extends StatefulWidget {
// 目前只需要标题和url吧。
  final String _title;
  final String _url;

  WebDetailPage(this._title, this._url);

  @override
  State<StatefulWidget> createState() => _WebDetailPageState(_title, _url);
}

class _WebDetailPageState extends State<WebDetailPage> {
  final String _title;
  final String _url;

  _WebDetailPageState(this._title, this._url);


  @override
  Widget build(BuildContext context) {
    print(_url);
    return WebviewScaffold(
      url: _url,
      withJavascript: true,
      appBar: AppBar(
        title: Text(
          _title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
