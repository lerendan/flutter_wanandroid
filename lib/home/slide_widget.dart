import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_wanandroid/home/banner.dart' as b;
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/home/web_page.dart';

class SlideView extends StatefulWidget {
  final _homeBannerHeight;

  final List<b.Data> topList;

  SlideView(this.topList, this._homeBannerHeight);

  @override
  State<StatefulWidget> createState() {
    return new _HomeBannerState();
  }
}

class _HomeBannerState extends State<SlideView> {
  static int fakeLength = 1000;

  int _curPageIndex = 0;

  int _curIndicatorsIndex = 0;

  PageController _pageController =
  new PageController(initialPage: fakeLength ~/ 2);

  List<Widget> _indicators = [];

  List<b.Data> _fakeList = [];

  Duration _bannerDuration = new Duration(seconds: 6);

  Duration _bannerAnimationDuration = new Duration(milliseconds: 500);

  Timer _timer;

  bool reverse = false;

  bool _isEndScroll = true;

  @override
  void initState() {
    super.initState();
    _curPageIndex = fakeLength ~/ 2;

    initTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  //通过时间timer做轮询，达到自动播放的效果
  initTimer() {
    _timer = new Timer.periodic(_bannerDuration, (timer) {
      if(_isEndScroll){
        _pageController.animateToPage(_curPageIndex + 1,
            duration: _bannerAnimationDuration, curve: Curves.linear);
      }
    });
  }

  //用于做banner循环
  _initFakeList() {
    for (int i = 0; i < fakeLength; i++) {
      _fakeList.addAll(widget.topList);
    }
  }

  _initIndicators() {
    _indicators.clear();
    for (int i = 0; i < widget.topList.length; i++) {
      _indicators.add(new SizedBox(
        width: 5.0,
        height: 5.0,
        child: new Container(
          color: i == _curIndicatorsIndex ? Colors.white : Colors.grey,
        ),
      ));
    }
  }

  _changePage(int index) {
    _curPageIndex = index;
    //获取指示器索引
    _curIndicatorsIndex = index % widget.topList.length;
    setState(() {});
  }

  //创建指示器
  Widget _buildIndicators() {
    _initIndicators();
    return new Align(
      alignment: Alignment.bottomCenter,
      child: new Container(
          color: Colors.black45,
          height: 20.0,
          child: new Center(
            child: new SizedBox(
              width: widget.topList.length * 16.0,
              height: 5.0,
              child: new Row(
                children: _indicators,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
          )),
    );
  }

  Widget _buildPagerView() {
    _initFakeList();
    //检查手指和自动播放的是否冲突，如果滚动停止开启自动播放，反之停止自动播放
    return new NotificationListener(
        onNotification: (ScrollNotification scrollNotification) {
          if (scrollNotification is ScrollEndNotification || scrollNotification is UserScrollNotification) {
            _isEndScroll = true;
          } else {
            _isEndScroll = false;
          }
          return false;
        },
        child: new PageView.builder(
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(context, index);
          },
          itemCount: _fakeList.length,
          onPageChanged: (index) {
            _changePage(index);
          },
        ));
  }

  Widget _buildBanner() {
    return new Container(
      height: widget._homeBannerHeight,
      //指示器覆盖在pagerview上，所以用Stack
      child: new Stack(
        children: <Widget>[
          _buildPagerView(),
          _buildIndicators(),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    b.Data item = _fakeList[index];
    return  new GestureDetector(
        onTap: () {
//        RouteUtil.route2Detail(context, '${item.id}'); // 通过路由跳转到详情
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new WebDetailPage(url: item.url,)),
          );
        },
        onTapDown: (donw) {
          _isEndScroll = false;
        },
        onTapUp: (up) {
          _isEndScroll = true;
        },
        child: new FadeInImage.memoryNetwork(
            placeholder: new Uint8List(0),
            image: item.imagePath,
            height: widget._homeBannerHeight,
            fit: BoxFit.fitWidth),
//      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBanner();
  }
}