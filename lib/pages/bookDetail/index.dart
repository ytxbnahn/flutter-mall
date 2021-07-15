import 'package:flutter/material.dart';
import 'package:flutter_mall/router/application.dart';

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

  go() {
    // Application.router.printTree();
    // Application.router.matchRoute(context, '/home?current=1');

    // Application.router.pop(context);
    Navigator.popUntil(context, ModalRoute.withName('/'));
    // Application.router.navigateTo(context, '/home?current=1', replace: true);
  }

  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("详情"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                child: const Text('叔 本'),
              ),
            ),
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
