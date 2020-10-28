import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // The parent widget.

  Tween<double> _scaleTween = Tween<double>(begin: 1, end: 2);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // removes the debug banner
      title: 'Flutter To-do List',

      home: Scaffold(
        body: Center(
          child: TweenAnimationBuilder(
            tween: _scaleTween,
            duration: Duration(milliseconds: 900),
            builder: (context, scale, child){
              return Transform.scale(scale: scale, child: child);
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.lightBlue[200],
              child: Center(
                child: Text(
                  'TEST XD',
                  style: Theme.of(context).textTheme.headline5,
                ),  //Text
              ),  //Center
            ),  //Container
          ),
        ),  //Center
      ),  //Scaffold

      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Baloo_Chettan_2",
      ),
      initialRoute: '/',
      routes: mainAppRoutes, // See 'routes.dart' for this
    );
  }
}

/*
class MyApp extends StatelessWidget {
  // The parent widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // removes the debug banner
      title: 'Flutter To-do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Baloo_Chettan_2",
      ),
      initialRoute: '/',
      routes: mainAppRoutes, // See 'routes.dart' for this
    );
  }
}

*/