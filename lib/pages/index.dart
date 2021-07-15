import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/my/index.dart';
import 'package:flutter_mall/pages/home/index.dart';
import 'package:flutter_mall/pages/shopcart/index.dart';
import 'package:flutter_mall/utils/color.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key, required this.current}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final int current;

  @override
  _IndexPageState createState() => _IndexPageState(this.current);
}

class _IndexPageState extends State<IndexPage> {
  _IndexPageState(current) {
    this._currentIndex = current;
  }
  // late String _titleT;
  late int _currentIndex; // 底部导航当前页面
  PageController _pageController = PageController();
  final List<Image> _tabImages = [
    Image.asset('assets/images/tabbar_btn1_select.png', width: 25, height: 25),
    Image.asset('assets/images/tabbar_btn1_normal.png', width: 25, height: 25),
    Image.asset('assets/images/tabbar_btn2_select.png', width: 25, height: 25),
    Image.asset('assets/images/tabbar_btn2_normal.png', width: 25, height: 25),
    Image.asset('assets/images/tabbar_btn3_select.png', width: 25, height: 25),
    Image.asset('assets/images/tabbar_btn3_normal.png', width: 25, height: 25),
  ];
  final List<Text> _titles = [
    Text('2040书店'),
    Text('购物车'),
    Text('我的'),
  ];

  var _pages = [
    HomePage(),
    ShopCartPage(),
    MyPage(),
  ];
  @override
  void initState() {
    super.initState();
    print('object');
  }

  Image _getBarImage(int index) {
    if (_currentIndex == index) {
      return _tabImages[index * 2];
    } else {
      return _tabImages[index * 2 + 1];
    }
  }

  Widget _currentPage() {
    return PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: _pages.length,
        itemBuilder: (context, index) => _pages[index]);
  }

  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
      appBar: _currentIndex != 2
          ? AppBar(
              title: _titles[_currentIndex],
            )
          : null,
      body: _currentPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (mounted)
            setState(() {
              _currentIndex = index;
            });
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: _getBarImage(0), //Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: _getBarImage(1), //Icon(Icons.home),
            label: '购物车',
          ),
          BottomNavigationBarItem(
            icon: _getBarImage(2), //Icon(Icons.home),
            label: '我的',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        //选中颜色
        fixedColor: ColorUtils.tabbartintcolor,
      ),
    );
  }
}
