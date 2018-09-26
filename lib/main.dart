import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/index/index.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '玩Android',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Index(),
    );
  }
}
