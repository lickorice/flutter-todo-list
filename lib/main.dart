import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To-do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter To-do List'),
        ),
        body: Text("Todo List Here"),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Some method here
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), 
      ),
    );
  }
}

