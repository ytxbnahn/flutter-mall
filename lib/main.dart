import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mall/utils/color.dart';
import 'package:flutter_mall/pages/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1226),
        builder: () => MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  textTheme: TextTheme(
                    headline6: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    bodyText1: TextStyle(color: Colors.black),
                  ),
                ),
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                scaffoldBackgroundColor: ColorUtils.viewbgcolor,
              ),
              home: IndexPage(title: 'Flutter Demo Home Page'),
            ));
  }
}
