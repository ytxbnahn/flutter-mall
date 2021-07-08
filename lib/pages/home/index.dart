import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import "package:flutter_mall/http/index.dart";

import './searchBar.dart';
import './bookItem.dart';

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
  List<dynamic> _bookList = [];
  List<dynamic> _bookHotList = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    var a = await ApiClient().getIndex();
    // var b = await ApiClient().getHotList();
    print(a.data.bookList);
    setState(() {
      this._bookList = a.data.bookList!;
      // this._bookHotList = b.data!;
    });
  }

  Widget titleBar(BuildContext context, title) {
    return new Center(
        child: Container(
      child: new Text(title),
      width: 216.w,
      height: 70.w,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
            'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg'),
        fit: BoxFit.cover,
      )),
    ));
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
                  height: 264.w,
                  child: new Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        "http://via.placeholder.com/350x150",
                        fit: BoxFit.fill,
                      );
                    },
                    itemHeight: 240.w,
                    outer: true,
                    itemCount: 3,
                    pagination: new SwiperPagination(
                        margin: new EdgeInsets.fromLTRB(0.0, 26.w, 0.0, 0),
                        builder: new DotSwiperPaginationBuilder(
                            color: Colors.white30,
                            activeColor: Color.fromRGBO(255, 186, 27, 1),
                            size: 8.w,
                            activeSize: 8.w)),
                    // control: new SwiperControl(),
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
              SliverToBoxAdapter(
                child: titleBar(context, '新书上架'),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return BookItemPage(data: _bookList[index]);
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
