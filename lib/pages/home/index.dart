import 'package:flutter/material.dart';
import 'package:flutter_mall/model/index.dart';
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
  List<BookItem> _bookList = [];
  List<dynamic> _hotList = [];

  List<BookSetItem> _bookSetList = [];
  List<BannerListItem> _bannerList = [];
  List<dynamic> _bookHotList = [];

  @override
  bool get wantKeepAlive => true;

  SwiperController? _swiperController;

  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();

    initData();
  }

  @override
  void dispose() {
    _swiperController!.stopAutoplay();
    _swiperController!.dispose();
    super.dispose();
  }

  void initData() async {
    var a = await ApiClient().getIndex();
    var b = await ApiClient().getHotList();
    print(b.data.list);
    setState(() {
      this._hotList = b.data.list;
      this._bannerList = a.data.bannerList!;
      this._bookSetList = a.data.bookSetList!;
      this._bookList = a.data.bookList!;
      // this._bookHotList = b.data!;
    });
  }

  Widget titleBar(BuildContext context, title) {
    return new Center(
        child: Container(
      child: new Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 32.w),
      ),
      width: 216.w,
      height: 70.w,
      margin: EdgeInsets.only(bottom: 40.w),
      alignment: Alignment.center,
      decoration: new BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/gm_homepagetitleicon.png'),
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
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: _bannerList.length > 0
                      ? new Swiper(
                          autoplay: true,
                          controller: _swiperController,
                          itemBuilder: (BuildContext context, int index) {
                            return new Image.network(
                              _bannerList[index].coverUrl ?? '',
                              fit: BoxFit.fill,
                            );
                          },
                          itemHeight: 240.w,
                          outer: true,
                          itemCount: _bannerList.length,
                          pagination: new SwiperPagination(
                              margin:
                                  new EdgeInsets.fromLTRB(0.0, 26.w, 0.0, 0),
                              builder: new DotSwiperPaginationBuilder(
                                  color: Colors.white30,
                                  activeColor: Color.fromRGBO(255, 186, 27, 1),
                                  size: 8.w,
                                  activeSize: 8.w)),
                          // control: new SwiperControl(),
                        )
                      : Container(),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.w, horizontal: 32.w),
                  height: 134.w,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _bookSetList.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        new Image.network(_bookSetList[index].icon ?? '',
                            fit: BoxFit.fill, height: 80.w, width: 80.w),
                        new Text(_bookSetList[index].setName!)
                      ]);
                    },
                    separatorBuilder: (context, index) => Container(
                      width: 48.w,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: titleBar(context, '????????????'),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(36.w, 0, 36.w, 60.w),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Column(children: [
                      Container(
                        child: new Image.network(
                          _bookList[index].cover!,
                          fit: BoxFit.cover,
                          width: 196.w,
                          height: 260.w,
                        ),
                        // width: 196.w,
                        // height: 360,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.w),
                        child: Text(
                          _bookList[index].bookname!,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ]);
                  }, childCount: _bookList.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 40.w,
                    crossAxisSpacing: 50.w,
                    childAspectRatio: 0.6,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: titleBar(context, '????????????'),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return BookItemPage(data: _hotList[index]);
                  },
                  childCount: _hotList.length,
                )),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image:
              NetworkImage('https://file.2040.guomai.cc/mall_index_bg@2x.png'),
          fit: BoxFit.cover,
        )));
  }
}
