import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: Text(
          '输入书名',
          style: TextStyle(
              fontSize: 28.w, color: Color.fromRGBO(211, 211, 211, 1)),
        ),
        height: 64.h,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.w),
            color: Color.fromRGBO(255, 255, 255, 1)),
        margin: EdgeInsets.fromLTRB(32.w, 20.w, 32.w, 20.w),
        padding: EdgeInsets.only(left: 42.w),
      ),
    );
  }
}
