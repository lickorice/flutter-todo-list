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

  void _addTodoListItemData() {
    setState(() {
      this._todoListItems.add(
        TodoListItemData("Item " + (this._todoListItems.length+1).toString(), false)
      );
    });
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemCount: _todoListItems.length,
      itemBuilder: (context, index) {
        return TodoListItem(_todoListItems[index]);
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
          _addTodoListItemData();
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

class TodoListItem extends StatefulWidget {
  final TodoListItemData itemData;
  TodoListItem(this.itemData);

  @override
  _TodoListItemState createState() => _TodoListItemState(itemData);
}

class _TodoListItemState extends State<TodoListItem> {
  final TodoListItemData itemData;
  _TodoListItemState(this.itemData);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: itemData.isChecked,
        onChanged: (bool value) {
          setState(() {
            itemData.isChecked = value;
          });
        }
      ),
      title: Text(itemData.itemTitle)
    );
  }
}