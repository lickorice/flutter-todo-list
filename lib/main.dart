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
      TodoListItemData("Item 1", false, this._removeTodoListItemData),
      TodoListItemData("Item 2", false, this._removeTodoListItemData),
      TodoListItemData("Item 3", true, this._removeTodoListItemData),
      TodoListItemData("Item 4", false, this._removeTodoListItemData),
      TodoListItemData("Item 5", true, this._removeTodoListItemData),
    ];
  }

  void _addTodoListItemData() {
    setState(() {
      this._todoListItems.add(
        TodoListItemData("Item " + (this._todoListItems.length+1).toString(), false, this._removeTodoListItemData)
      );
    });
  }

  void _removeTodoListItemData(TodoListItemData item) {
    setState(() {
      this._todoListItems.remove(item);
    });
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemCount: _todoListItems.length,
      itemBuilder: (context, index) {
        return TodoListItem(_todoListItems[index], ObjectKey(_todoListItems[index]));
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
        backgroundColor: Colors.green,
      ), 
    );
  }
}

class TodoListItemData {
  String itemTitle;
  bool isChecked;
  Function(TodoListItemData) removeSelf;
  TodoListItemData(this.itemTitle, this.isChecked, this.removeSelf);
}

class TodoListItem extends StatefulWidget {
  final TodoListItemData itemData;
  TodoListItem(this.itemData, Key key) : super(key: key);

  @override
  _TodoListItemState createState() => _TodoListItemState(itemData);
}

class _TodoListItemState extends State<TodoListItem> {
  TodoListItemData itemData;
  TextEditingController itemTitleController = new TextEditingController();
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(itemData.itemTitle),
          Row (
            children: <Widget>[
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text("Change Item Title"),
                      content: TextField(
                        decoration: new InputDecoration(hintText: "Item title"),
                        controller: itemTitleController,
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("SAVE"),
                          onPressed: () {
                            setState(() {
                              itemData.itemTitle = itemTitleController.text;
                            });
                            Navigator.of(context).pop();
                          }
                        )
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.edit),
                color: Colors.blue,
              ),
              IconButton(
                onPressed: () {
                  itemData.removeSelf(itemData);
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
            ],
          ),
        ]
      )
    );
  }
}