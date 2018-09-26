import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebDetailPage extends StatefulWidget {

  String url;

  WebDetailPage({Key key, this.url}) :super(key: key);

  @override
  State<StatefulWidget> createState() => new WebPageState(url: this.url);
}

class WebPageState extends State<WebDetailPage> {

  String url;
  bool loaded = false;
  String detailDataStr;
  final flutterWebViewPlugin = new FlutterWebviewPlugin();

  WebPageState({Key key, this.url});

  @override
  void initState() {
    super.initState();
    // 监听WebView的加载事件
    flutterWebViewPlugin.onStateChanged.listen((state) {
      print("state: ${state.type}");
      if (state.type == WebViewState.finishLoad) {
        // 加载完成
        setState(() {
          loaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> titleContent = [];
    titleContent.add(
      new Expanded(child: new Text("文章详情", style: new TextStyle(color: Colors.white),)));

//    titleContent.add(new Expanded(child: ,));

    if (!loaded) {
      titleContent.add(new CupertinoActivityIndicator());
    }

    return new WebviewScaffold(
      url: this.url,
      appBar: new AppBar(
        title: new Row(
          children: titleContent,
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}