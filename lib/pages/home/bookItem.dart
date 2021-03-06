import "package:flutter/material.dart";
import 'package:flutter_mall/components/markAndRetailPrice.dart';
import 'package:flutter_mall/model/index.dart';
import 'package:flutter_mall/router/application.dart';
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
    return InkWell(
        child: Container(
          child: Row(children: [
            Stack(children: [
              Image.network(
                widget.data.cover ?? '',
                width: 196.w,
                height: 260.w,
                fit: BoxFit.cover,
              ),
              widget.data.canbuy ?? false
                  ? Container(
                      child: new Text('暂无库存'),
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
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 28.w, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    child: new Text(
                      widget.data.author!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 60.w, bottom: 20.w),
                  ),
                  MarkAndRetailPrice(
                      markPrice: widget.data.markPrice! / 100,
                      retailPrice: widget.data.retailPrice! / 100),
                  Container(
                    margin: EdgeInsets.only(top: 12.w),
                    child: Row(
                      children: [
                        new Container(
                          child: new Text(
                            "第一名",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.w),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 75, 75, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          width: 80.w,
                          height: 44.w,
                          alignment: AlignmentDirectional.center,
                        ),
                        Image.asset(
                          'assets/images/gm_shoppingcarticon.png',
                          width: 29.w,
                          height: 28.w,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              width: 470.w,
              height: 260.w,
            )
          ]),
          width: 684.w,
          margin: EdgeInsets.only(bottom: 60.w),
        ),
        onTap: () {
          Application.router.navigateTo(context, '/bookDetail?id=12');
        });
  }
}
