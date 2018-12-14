import 'package:flutter/material.dart';
import 'home.dart';



class MyAppA extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'LILY',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new HomePage(),
      );
    }
}