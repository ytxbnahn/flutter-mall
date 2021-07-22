import 'package:flutter/material.dart';
import 'package:flutter_mall/http/index.dart';
import 'package:flutter_mall/model/index.dart';
import 'package:flutter_mall/pages/home/bookItem.dart';
import 'package:flutter_mall/router/application.dart';
import 'package:flutter_mall/events/index.dart';
import 'package:flutter_mall/utils/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailPage extends StatefulWidget {
  final String id;
  BookDetailPage({Key? key, required this.id}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  int _counter = 0;
  BookItem? _bookDetail;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    var res = await ApiClient().getBookDetailById(widget.id);
    print(res.data);
    setState(() {
      this._bookDetail = res.data;
    });
  }

  go() {
    // Application.router.printTree();
    // Application.router.matchRoute(context, '/home?current=1');

    // Application.router.pop(context);
    Navigator.popUntil(context, ModalRoute.withName('/'));
    eventBus.fire(ChangeIndexTabEvent(1));
    // Application.router.navigateTo(context, '/home?current=1', replace: true);
  }

  Widget _buildBackAndShare(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Image.asset(
          'assets/images/gm_bookdetailshare@2x.png',
          width: 86.w,
          height: 48.w,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      margin: EdgeInsets.only(top: 60.w),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: _buildBackAndShare(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        appBar: AppBar(
//        backgroundColor: Colors.transparent,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          elevation: 0,
          leading: GestureDetector(
              child: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/nav_onbackwhite_Icon.png',
            ),
          )),
        ),
        body: CustomScrollView(
          slivers: [
            !isEmpty(this._bookDetail)
                ? SliverToBoxAdapter(
                    child: Container(
                      child: BookItemPage(
                        data: this._bookDetail!,
                      ),
                    ),
                  )
                : Container(),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(child: new Text('d')),
                    childCount: 5)),
            SliverToBoxAdapter(
              child: Container(
                child: TextButton(
                  child: const Text('购物车'),
                  onPressed: () {
                    go();
                  },
                ),
              ),
            )
          ],
        ));
  }
}
