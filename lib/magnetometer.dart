import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

import 'dart:math';



class Magnetometer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _direction;



  @override
  Widget build(BuildContext context) {


    return new Card(
      child: new Column(
        children: <Widget>[
          new Text(
            'Geolocation value',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),

          new Padding(
              padding: new EdgeInsets.all(7.0),
              child: new Transform.rotate(
                angle: ((_direction ?? 0) * (math.pi / 180) * -1),
                child: new Image.asset('assets/compass.jpg'),
              ),
          )
        ],
      ),
    );
  }




  @override
  void initState() {
    super.initState();
    FlutterCompass.events.listen((double direction) {
      setState(() {
        _direction = direction;
      });
    });
  }
}
