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
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List <TodoListItemData> _todoListItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter To-do List'),
      ),
      body: Text("Todo List 2 Here"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Some method here
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}

class TodoListItemData {
  String itemTitle;
  bool isChecked;
  TodoListItemData(this.itemTitle, this.isChecked);
}