import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/home/home_page.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {

  final navigationBarTitles = ['首页', '项目','体系', '我的'];

  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final _body = new IndexedStack(
      children: <Widget>[
        new HomePage(),
        new Center(child: new Text("1")),
        new Center(child: new Text("2")),
        new Center(child: new Text("3"))
      ],
      index: _currentIndex,
    );

    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text('WAN ANDROID'),
        ),
        body: _body,
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the Drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _bottomNavigationColor,
                ),
                title: Text(
                  navigationBarTitles[0],
                  style: TextStyle(color: _bottomNavigationColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.email,
                  color: _bottomNavigationColor,
                ),
                title: Text(
                  navigationBarTitles[1],
                  style: TextStyle(color: _bottomNavigationColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pages,
                  color: _bottomNavigationColor,
                ),
                title: Text(
                  navigationBarTitles[2],
                  style: TextStyle(color: _bottomNavigationColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: _bottomNavigationColor,
                ),
                title: Text(
                  navigationBarTitles[3],
                  style: TextStyle(color: _bottomNavigationColor),
                )),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.shifting,
        ),
      );
  }
}