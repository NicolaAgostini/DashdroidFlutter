import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'dart:math';



class AccelerometerValue extends StatelessWidget {


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




  double x=1.0,y=1.0,z=1.0;

  @override
  Widget build(BuildContext context) {





    return new Card(
      child: new Column(
        children: <Widget>[
          new Text(
            'Accelerometer value',
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
                      child: new Column(
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(7.0),
                            child:
                            //new Text('Accelerometer: $gyroscope',
                            new Text(
                                'x=' + (x).toInt().toStringAsFixed(1),
                                style: new TextStyle(fontSize: 18.0)),
                          ),
                          new ConstrainedBox(
                            constraints: new BoxConstraints(
                              minHeight: 5.0,
                              minWidth: (pow(x,2)).abs()>MediaQuery.of(context).size.width? MediaQuery.of(context).size.width:(pow(x,2)),
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
                                " y=" + (y).toInt().toStringAsFixed(1),
                                style: new TextStyle(fontSize: 18.0)),
                          ),
                          new ConstrainedBox(
                            constraints: new BoxConstraints(
                              minHeight: 5.0,
                              minWidth: (pow(y,2)).abs()>MediaQuery.of(context).size.width? MediaQuery.of(context).size.width:(pow(y,2)),
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
                                "z= "+(z).toInt().toStringAsFixed(1),
                                style: new TextStyle(fontSize: 18.0)),
                          ),
                          new ConstrainedBox(
                            constraints: new BoxConstraints(
                              minHeight: 5.0,
                              minWidth: (pow(z,2)).abs()>MediaQuery.of(context).size.width? MediaQuery.of(context).size.width:(pow(z,2)),
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
              )
          )
        ],
      ),
    );
  }



  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });

  }
}
