import 'package:flutter/material.dart';
import '../accelerometer.dart';
import '../position.dart';
import '../gyroscope.dart';

class ArticalFragment extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text("Home"),
          backgroundColor: Colors.green[600],
        ),
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