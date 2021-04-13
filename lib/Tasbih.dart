import 'package:dikr_kaman/CircleDecoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:vibration/vibration.dart';
///
/// Date  : 2021/04/13
/// Author: BBKOUTY
///
/// This file contain the Tasbih widget. The purpose of this widget is to
/// handle all the interactions with the user.
///
class Tasbih extends StatefulWidget {
  final String title;

  Tasbih({Key key, this.title}) : super(key: key);

  @override
  _Tasbih createState() => _Tasbih();
}

class _Tasbih extends State<Tasbih> {

  /// This bool helps for knowing if it's 33 or 99.
  bool isThirtyThree = true;
  /// This bool helps handle the state of vibration.
  bool phoneBuzzed = true;
  /// The counter that match to the state of isThirtyThree.
  int incrementCounter = 0;
  /// The total number of taps on the screen.
  int totalTap = 0;
  /// To know the state of the FAB.
  bool fabTap = false;
  /// In case we want to, the 3 zikr that we show.
  List listZikr = ['SoubhaanAllah','Alhamdoulillah','AllahouAkbar'];
  /// The position of the word that we have to show.
  int indexZikr = 0;

  /// This function initialize the counter.
  void initCounter() {
    setState(() {
      incrementCounter = 1;
    });
  }

  /// This function handle what to do when we press the 33/99 button.
  void onThirtyThreeTap(){
    setState(() {
      isThirtyThree = !isThirtyThree;
    });
    isThirtyThree && incrementCounter > 33
        ? incrementCounter = 0
        : incrementCounter = incrementCounter;
    //to restart the word that we have to show.
    incrementCounter == 0 ? indexZikr = 0 : indexZikr = indexZikr;

  }

  /// This function handle the actions of the refresh button.
  void onRefresh(){
    setState(() {
      incrementCounter = 0;
      totalTap = 0;
      indexZikr = 0;
    });
  }

  /// This function manage the onTap for the InkWell widget.
  void onTapPad(){
    // If the buzz is active then buzz every time we tap the zone.
    if (phoneBuzzed) {
      Vibration.vibrate(duration: 250);
    }
    // Increase the total number of taps.
    totalTap++;
    // Managing the state of the counter.
    incrementCounter == 33 && isThirtyThree
        ? initCounter()
        : !isThirtyThree && incrementCounter == 99
        ? initCounter()
        : setState(() {
      incrementCounter++;
    });
    // What to do when we have 33 and that we have tapped 33 times.
    if (isThirtyThree && incrementCounter % 33 == 0) {
      Vibration.vibrate(duration: 500);
      indexZikr.clamp(0, 2) == 2  && fabTap ? indexZikr=0 : indexZikr++;
    }
    // What to do when we have 99 and that we have tapped 99 times.
    if (!isThirtyThree && incrementCounter % 99 == 0) {
      Vibration.vibrate(duration: 500);
      indexZikr.clamp(0, 2) == 2 && fabTap ? indexZikr=0 : indexZikr++;
    }
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
            icon: Icon(
              phoneBuzzed ? Icons.vibration : Icons.notifications_off
            ),
            onPressed: () => setState(() {
                phoneBuzzed = !phoneBuzzed;
            }),
          ),
          TextButton(
            onPressed: onThirtyThreeTap,
            child: Text(
              isThirtyThree ? '33' : '99',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            style: TextButton.styleFrom(
              shape: CircleBorder(
                  side: BorderSide(width: 3.0, color: Colors.white)),
            ),
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: onRefresh,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade800,
        child: Text(
          fabTap ? listZikr[indexZikr] : 'الله سبحانه وتعالى',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18.5,
            height: 1.5,
            color: Colors.white
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        backgroundColor: Colors.grey.shade800,
        child: Icon(
          fabTap ? Icons.remove_red_eye : Icons.remove_red_eye_outlined
        ),
        onPressed: ()=> setState((){
          fabTap = !fabTap;
          indexZikr = 0;
          fabTap ? incrementCounter = 0 : incrementCounter= incrementCounter;
        }),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 7 / 3,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/coran.jpg'), fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: LiquidCircularProgressIndicator(
                        value: isThirtyThree ? incrementCounter / 33 : incrementCounter / 99,
                        center: Text(
                          isThirtyThree ? '$incrementCounter/33' : '$incrementCounter/99',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                    text: 'Total:   $totalTap',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      height: 1.5,
                    ),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.shade800),
              child: ClipPath(
                clipper: RoundedDiagonalPathClipper(),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.green),
                  child: InkWell(
                    splashColor: Colors.white,
                    hoverColor: Colors.white,
                    onTap: onTapPad,
                    child: CircleDecoration(300.0, Colors.grey.shade800,
                      CircleDecoration(200.0, Colors.green,
                        CircleDecoration(100.0, Colors.grey.shade800, null)
                      )
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
