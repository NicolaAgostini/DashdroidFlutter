import 'package:flutter/material.dart';
import '../accelerometer.dart';
import '../position.dart';
import '../gyroscope.dart';

class ArticalFragment extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            child: new ListView(
              children: <Widget> [new AccelerometerValue(),
              new GyroscopeValue(),
              new PositionValue()
              ],
            )

        )
    );
    }
}