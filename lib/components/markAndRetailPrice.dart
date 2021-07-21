import 'package:flutter/material.dart';

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
    return Row(children: [
      Stack(
        children: [
          new Text(widget.markPrice.toString()),
          Container(
            width: 40,
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
          )
        ],
      )
    ]);
  }
}
