import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go_me/fourPage.dart';
import 'package:flutter_go_me/onPage.dart';
import 'package:flutter_go_me/threePage.dart';
import 'package:flutter_go_me/twoPage.dart';

class ApplicationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ApplicationPageState();
  }
}

class _ApplicationPageState extends State<ApplicationPage> {
  /// 当前页
  int _currentPageIndex = 0;

  /// 初始页面
  var _pageController = new PageController(initialPage: 0);

  /// 首页下标题与icon
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心')),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我是AppBar"),

        centerTitle: true,
      ),
      body: new PageView.builder(
        onPageChanged: _pageChange,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return new onePage();
              break;
            case 1:
              return new twoPage();
              break;
            case 2:
              return new threePage();
              break;
            case 3:
              return new fourPage();
              break;
            default:
              return new onePage();
              break;
          }
        },
        itemCount: 4,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomTabs,
        currentIndex: _currentPageIndex,
        onTap: onTap,
      ),
    );
  }

  // bottomnaviagtionbar 和 pageview 的联动
  void onTap(int index) {
    // 过pageview的pagecontroller的animateToPage方法可以跳转
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _pageChange(int index) {
    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
  }
}
