import 'package:flutter/material.dart';

class TasbihPage extends StatefulWidget {
  TasbihPage({Key key, this.title}): super(key: key);

  final String title;

  @override
  _TasbihPage createState() => _TasbihPage();
}

class _TasbihPage extends State<TasbihPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Test for this Tasbih'),
      ),
    );
  }
}