import 'package:dikr_kaman/tasbihPage.dart';
import 'package:dikr_kaman/zikrPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListePage extends StatefulWidget {
  MyListePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyListePageState createState() => _MyListePageState();
}

class _MyListePageState extends State<MyListePage> {
  int _counter = 0;

  final pageController = PageController(
    initialPage: 0,
  );

  void _incrementCounter() {
    setState(() {
      _counter++;
      if(_counter==6){
        _counter=1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        controller: pageController,
        children: [
          ZikrPage(title: 'tes',),
          TasbihPage(title: 'ljal',),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.menu),
        elevation: 17.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 30.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.grey,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
