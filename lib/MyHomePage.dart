import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: InkWell(
        onTap: _incrementCounter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Container(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: LiquidCircularProgressIndicator(
                    value: _counter/5,
                    valueColor: AlwaysStoppedAnimation(Colors.green.shade500),
                    backgroundColor: Colors.white,
                    borderColor: Colors.red,
                    borderWidth: 5.0,
                    direction: Axis.vertical,
                    center: Text('$_counter'),
                  ),
                ),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
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