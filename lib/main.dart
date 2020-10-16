import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

void main() => runApp(MyApp());

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

