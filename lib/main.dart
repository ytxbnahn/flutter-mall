import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mall/utils/color.dart';
import './router/application.dart';
import './router/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  _MyApp() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

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
              onGenerateRoute: Application.router.generator,
            ));
  }
}
