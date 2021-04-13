import 'package:flutter/cupertino.dart';
///
/// Date   : 2021/04/13
/// Author : BBKOUTY
///
/// This class is for decomposing and not have to repeat the same code.
/// It'll create a circle into an other for example but it just create
/// a circular container and decorate it with a given color.
///
class CircleDecoration extends StatelessWidget {

  /// The height and color used to make the decoration
  final _height, _color;
  /// And a widget to decorate
  final _child;

  const CircleDecoration(this._height, this._color, this._child);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: _height??10.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _color,
          ),
          child: _child??Container(),
        )
    );
  }
}
