/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:flutter_mall/pages/bookDetail/index.dart';
import 'package:flutter_mall/pages/index.dart';

import 'package:flutter/painting.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  int current = int.parse(params["current"]?.first ?? '0');

  return IndexPage(current: current);
});

var bookDetailHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String id = params["id"]?.first ?? '';
  if (id.isEmpty) {
    return Container(child: const Text('404'));
  }
  return BookDetailPage(id: id);
});
