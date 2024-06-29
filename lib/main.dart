import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_blog/index.dart';
import 'package:flutter_application_blog/page/appbar.dart';
import 'package:flutter_application_blog/page/findFriend.dart';
import 'package:flutter_application_blog/page/friendBookLog.dart';
import 'package:flutter_application_blog/page/friendpost.dart';
import 'package:flutter_application_blog/page/login.dart';
import 'package:flutter_application_blog/page/myBookLog.dart';
import 'package:flutter_application_blog/page/timerMain.dart';
import 'package:flutter_application_blog/page/timerStart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: login(),
      ),
    );
  }
}
