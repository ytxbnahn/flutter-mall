import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './searchBar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  String _name = 'home';
  final List _bookList = [
    {'name': 'dddf'},
    {'name': 'dddfd'}
  ];

  @override
  bool get wantKeepAlive => true;

  Widget SwiperWidget(BuildContext context) {
    return Container(child: null);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              HomeSearchBar(),
              SliverToBoxAdapter(
                child: Container(
                  child: Text(
                    '请输入',
                    style: TextStyle(fontSize: 28.w),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 100.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 750.w,
                        padding: EdgeInsets.all(0),
                        color: Colors.primaries[index],
                      );
                    },
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Text(_bookList[index]['name']);
                },
                childCount: _bookList.length,
              )),
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg'),
          fit: BoxFit.cover,
        )));
  }
}
