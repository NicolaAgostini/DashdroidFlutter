import 'package:geolocator/geolocator.dart';

import 'dart:async';
import 'package:flutter/material.dart';

import 'dart:math';



class PositionValue extends StatelessWidget {


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


  StreamSubscription<Position> positionStream;
  String Latitude ="/";
  String Longitude ="/";


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
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child:
                    //new Text('Accelerometer: $gyroscope',
                    new Text(
                        "Latitude: "+Latitude,
                        style: new TextStyle(fontSize: 15.0)),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child:
                    //new Text('Accelerometer: $gyroscope',
                    new Text(
                        "Longitude: "+Longitude,
                        style: new TextStyle(fontSize: 15.0)),
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
    var geolocator = Geolocator();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

    positionStream = geolocator.getPositionStream(locationOptions).listen(
            (Position position) {
              setState(() {
                Latitude=position.latitude.toString();
                Longitude=position.longitude.toString();
              });
          print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
        });


    /*
    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <int>[(event.x*10).toInt(), (event.x*10).toInt(), (event.x*10).toInt()];
      });
    }));
  */
  }
}

