import 'package:flutter/material.dart';
import 'camera.dart';
import 'accelerometer.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'gyroscope.dart';
import 'position.dart';
import 'package:flutter/services.dart';
import 'mainA.dart';




void main() {

  initializeCamera();
  runApp(new MyApp());
}

Future<void> initializeCamera() async {
  // Fetch the available cameras before initializing the app.
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    print("isIos. "+isIOS.toString());
    if(isIOS)                                                             //IF IOS
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),

      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.home),
              ),
              Tab(
                icon: new Icon(Icons.camera),
              ),
            ],
            labelColor: Colors.green[700],
            unselectedLabelColor: Colors.lightGreen[400],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.green[900],
          ),

          body: TabBarView(
            children: [
              new MyHomePage(title: ''),
              new CameraApp()
            ],
          ),
        ),
      ),
    );

    else  {     // IF ANDROID
      return new MyAppA();

    }


  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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



void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

