import "package:flutter/material.dart";
import 'package:flutter_mall/model/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItemPage extends StatefulWidget {
  BookItemPage({Key? key, required this.data}) : super(key: key);
  final BookItem data;
  @override
  createState() => _BookItemPage();
}

class _BookItemPage extends State<BookItemPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Stack(children: [
          Image.network(
            widget.data.cover ?? '',
            width: 196.w,
            height: 260.w,
            fit: BoxFit.cover,
          ),
          widget.data.canbuy ?? true
              ? Container(
                  child: new Text(widget.data.canbuy.toString()),
                  margin: EdgeInsets.only(top: 212.w),
                  width: 196.w,
                  height: 48.w,
                  alignment: Alignment.center,
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                )
              : Container()
        ]),
        Container(
          margin: EdgeInsets.only(left: 20.w),
          child: Column(
            children: [
              new Text(
                widget.data.bookname!,
                style: TextStyle(fontSize: 28.w),
                textAlign: TextAlign.left,
              ),
              new Text(
                widget.data.canbuy.toString(),
                textAlign: TextAlign.left,
              ),
              Row(
                children: [
                  new Text('28', style: TextStyle(fontSize: 28.w)),
                  new Text('29'),
                ],
              ),
              Row(children: [
                new Container(
                  child: new Text("第一名"),
                ),
                new Text('ddd')
              ], mainAxisAlignment: MainAxisAlignment.spaceBetween)
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          width: 470.w,
          height: 260.w,
        )
      ]),
      width: 684.w,
    );
  }
}
