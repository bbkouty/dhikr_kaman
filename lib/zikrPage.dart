import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class ZikrPage extends StatefulWidget {
  ZikrPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _ZikrPage createState() => _ZikrPage();
}

class _ZikrPage extends State<ZikrPage>{
  int _counter = 0;
  bool _condition = false;

  void _incremetCounter(){
    setState(() {
      _counter++;
      if(_counter == 6){
        _counter = 1;
        _condition = true;
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
        onTap: _incremetCounter,
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
                    center: Text('$_counter/5',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
              ),
              _condition != false ? Text(
                'The text to affiche',
              ) : Text(''),
            ],
          ),
        ),
      ),
    );
  }
}