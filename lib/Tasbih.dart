import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:vibration/vibration.dart';

class Tasbih extends StatefulWidget {
  final String title;

  Tasbih({Key key, this.title}) : super(key: key);

  @override
  _Tasbih createState() => _Tasbih();
}

class _Tasbih extends State<Tasbih> {
  bool numbered = true;
  bool buzzed = true;
  int increment = 0;
  int total=0;

  void initialise(){
    setState(() {
      increment = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon( buzzed ? Icons.vibration : Icons.notifications_off),
            onPressed: () {
              setState(() {
                buzzed = !buzzed;
              });
            },
          ),
          IconButton(
            icon: TextButton(
              onPressed: (){
                setState(() {
                numbered = !numbered;
                });
                numbered && increment >33 ? initialise() : increment=increment ;
              },
              child: Text(numbered ? '33': '99',
                style: Theme.of(context).textTheme.caption,
              ),
              style: TextButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(
                    width: 2.0,
                    color: Colors.white
                  )
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                increment=0;
                total=0;
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 30,
        decoration: BoxDecoration(
          color: Colors.grey.shade800
        ),
        child: Center(
          child: Text( 'الله سبحانه وتعالى',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18.5,
              height: 1.5,
              color: Colors.white
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 7 / 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/coran.jpg'),
                  fit: BoxFit.fill
                )
              ),
              //elevation: 7.0,
              //shadowColor: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: LiquidCircularProgressIndicator(
                        value: numbered ? increment/33 : increment/99,
                        center: Text(
                          numbered ? '$increment/33': '$increment/99',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Total:   $total',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        height: 1.5,
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade800
                ),
                child: ClipPath(
                  clipper: RoundedDiagonalPathClipper(),
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.green
                    ),
                    child: InkWell(
                      splashColor: Colors.white,
                      hoverColor: Colors.white,
                      onTap: () {
                        if (buzzed) {Vibration.vibrate(duration: 250);}
                        total ++;
                        increment==33 && numbered ? initialise():
                        !numbered && increment == 99 ? initialise() : setState(() {
                          increment ++;
                        });
                        if(numbered && increment%33 == 0){Vibration.vibrate(duration: 500);}
                        if(!numbered && increment%99 == 0){Vibration.vibrate(duration: 500);}
                      },
                      child: Center(
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade800
                          ),
                          child: Center(
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green
                              ),
                              child: Center(
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          //Row(),
          //InkWell(),
        ],
      ),
    );
  }
}