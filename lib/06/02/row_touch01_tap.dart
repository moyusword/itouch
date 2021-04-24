import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'ntap.dart';
import 'two_tap.dart';

class RawGestureDetectorDemo extends StatefulWidget {
  @override
  _RawGestureDetectorDemoState createState() => _RawGestureDetectorDemoState();
}

class _RawGestureDetectorDemoState extends State<RawGestureDetectorDemo> {
  String action = '';
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var gestures = <Type, GestureRecognizerFactory>{

      NTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<NTapGestureRecognizer>(() {
        return NTapGestureRecognizer(maxN: 8);
      },
            (NTapGestureRecognizer instance) {
          instance
            ..onNTap = _onNTap
            ..onNTapDown = _onNTapDown
            ..onNTapCancel = _onNTapCancel;
        },
      ),
      // DoubleTapGestureRecognizer:
      //     GestureRecognizerFactoryWithHandlers<DoubleTapGestureRecognizer>(() {
      //   return DoubleTapGestureRecognizer();
      // }, (DoubleTapGestureRecognizer instance) {
      //   instance
      //     ..onDoubleTap = _doubleTap
      //     ..onDoubleTapDown = _doubleDown
      //     ..onDoubleTapCancel = _doubleTapCancel;
      // }),
      TapGestureRecognizer:
      GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(() {
        return TapGestureRecognizer();
      }, (TapGestureRecognizer instance) {
        instance
          ..onTapDown = _tapDown
          ..onTapCancel = _tapCancel
          ..onTapUp=_tapUp
          ..onTap = _tap;
      }),
    };
    return RawGestureDetector(
      gestures: gestures,
      child: Container(
          width: 100.0,
          height: 100.0,
          color: color,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "8 连击测试",
                style: TextStyle(color: Colors.white,fontSize: 24),
              ),
              Text(
                "Action:$action",
                style: TextStyle(color: Colors.white,fontSize: 24),
              ),
            ],
          )),
    );
  }



  void _tapDown(TapDownDetails details) {
    print('_tapDown');
    // setState(() {
    //   action = 'down';
    //   color = Colors.blue;
    // });
  }

  void _tapUp(TapUpDetails details) {
    print('_tapUp');

    // setState(() {
    //   action = 'up';
    //   color = Colors.blue;
    // });
  }

  void _tap() {
    print('_tap');
    setState(() {
      action = 'tap';
      color = Colors.blue;
    });
  }

  void _tapCancel() {
    print('_tapCancel');
    // setState(() {
    //   action = 'cancel';
    //   color = Colors.orange;
    // });
  }

  void _onNTap() {
    print('_onNTap-----[8]---');

    setState(() {
      action = '_on 8 Tap';
      color = Colors.green;
    });
  }

  void _onNTapDown(TapDownDetails details,int n) {
    print('_onNTapDown----$n---');
    setState(() {
      action = '_onNTapDown 第 $n 次';
      color = Colors.orange;
    });
  }

  void _onNTapCancel(int n) {
    print('_onNTapCancel');
    setState(() {
      action = '_onNTapCancel 第 $n 次';
      color = Colors.red;
    });
  }

  void onPanDown(DragDownDetails details) {
    print('onPanDown');
  }

  void _doubleTap() {
    print('_doubleTap');

    setState(() {
      action = 'doubleTap';
      color = Colors.red;
    });
  }

  void _doubleDown(TapDownDetails details) {
    print('_doubleDown');
  }

  void _doubleTapCancel() {
    print('_doubleTapCancel');
  }

  void onPanStart(DragStartDetails details) {
    print('onPanStart');
  }

  void onPanUpdate(DragUpdateDetails details) {
    print('onPanUpdate');
  }

  void onPanEnd(DragEndDetails details) {
    print('onPanEnd');
  }

  void onPanCancel() {
    print('onPanCancel');
  }
}
