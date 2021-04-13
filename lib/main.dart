/**
 * Date  : 2021/04/13
 * Author: SOUARE
 **/
/// the main file of the project

import 'package:dikr_kaman/Tasbih.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Tasbih(title: 'Tasbih',)
    );
  }
}

