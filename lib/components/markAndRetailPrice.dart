import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarkAndRetailPrice extends StatefulWidget {
  MarkAndRetailPrice(
      {Key? key, required this.markPrice, required this.retailPrice})
      : super(key: key);
  final double markPrice;
  final double retailPrice;
  @override
  createState() => _MarkAndRetailPrice();
}

class _MarkAndRetailPrice extends State<MarkAndRetailPrice> {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: <TextSpan>[
        TextSpan(
            text: '¥' + widget.retailPrice.toString(),
            style: TextStyle(
              color: Colors.red,
              fontSize: 36.w,
            )),
        TextSpan(
            text: '¥' + widget.markPrice.toString(),
            style: TextStyle(
                color: Color.fromRGBO(153, 153, 153, 1),
                fontSize: 24.w,
                decoration: TextDecoration.lineThrough)),
      ],
    )
        // crossAxisAlignment: CrossAxisAlignment.end,
        );
  }
}
