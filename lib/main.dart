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
  void initState() {
    super.initState();
    _todoListItems = [
      TodoListItemData("Item 1", false),
      TodoListItemData("Item 2", false),
      TodoListItemData("Item 3", true),
      TodoListItemData("Item 4", false),
      TodoListItemData("Item 5", true),
    ];
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemCount: _todoListItems.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(_todoListItems[index].itemTitle));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter To-do List'),
      ),
      body: _buildTodoList(),
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