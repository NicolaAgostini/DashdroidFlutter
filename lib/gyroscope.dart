import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'dart:math';



class GyroscopeValue extends StatelessWidget {


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




  double x=0.0, y=0.0, z=0.0;


  @override
  Widget build(BuildContext context) {


    return new Card(
      child: new Column(
        children: <Widget>[
          new Text(
            'Gyroscope value',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),

          new Padding(
              padding: new EdgeInsets.all(7.0),
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child:
                    //new Text('Accelerometer: $gyroscope',
                    new Text(
                        'x=' + (x*10).toInt().toStringAsFixed(1),
                        style: new TextStyle(fontSize: 18.0)),
                  ),
              new ConstrainedBox(
                constraints: new BoxConstraints(
                   minHeight: 5.0,
                    minWidth: (x*10).abs()>MediaQuery.of(context).size.width? MediaQuery.of(context).size.width:(x*10).abs(),
                   maxHeight: 30.0,
                   maxWidth: MediaQuery.of(context).size.width,
                  ),
                 child: new DecoratedBox(
                  decoration: new BoxDecoration(color: Colors.red),
                 ),
              ),
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child:
                    //new Text('Accelerometer: $gyroscope',
                    new Text(
                         " y=" + (y*10).toInt().toStringAsFixed(1),
                        style: new TextStyle(fontSize: 18.0)),
                  ),
                  new ConstrainedBox(
                    constraints: new BoxConstraints(
                      minHeight: 5.0,
                      minWidth: (y*10).abs()>MediaQuery.of(context).size.width? MediaQuery.of(context).size.width:(y*10).abs(),
                      maxHeight: 30.0,
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    child: new DecoratedBox(
                      decoration: new BoxDecoration(color: Colors.blue),
                    ),
                  ),

                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child:
                    //new Text('Accelerometer: $gyroscope',
                    new Text(
                       "z= " + (z*10).toInt().toStringAsFixed(1),
                        style: new TextStyle(fontSize: 18.0)),
                  ),
                  new ConstrainedBox(
                    constraints: new BoxConstraints(
                      minHeight: 5.0,
                      minWidth: (z*10).abs()>MediaQuery.of(context).size.width? MediaQuery.of(context).size.width:(z*10).abs(),
                      maxHeight: 30.0,
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    child: new DecoratedBox(
                      decoration: new BoxDecoration(color: Colors.green),
                    ),
                  ),

                ],
              )
          )
        ],
      ),
    );
  }




  @override
  void initState() {
    super.initState();

    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
     }
    );

    /*
    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <int>[(event.x*10).toInt(), (event.x*10).toInt(), (event.x*10).toInt()];
      });
    }));
  */
  }
}

