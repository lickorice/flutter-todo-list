import 'package:flutter/material.dart';

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
      ),
      home: TodoList(), // Calls the TodoList() scaffold here
    );
  }
}

class TodoList extends StatefulWidget {
  // TodoList is stateful, since the list itself changes.
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // We initialize a list of TodoListItemData instances, we will build
  // the TodoListItem widgets around these as the TodoList updates
  // its state:
  List <TodoListItemData> _todoListItems;

  // We override the initState() function because we cannot pass the
  // _removeTodoListItemData function to instantiation.
  @override
  void initState() {
    // We place 5 placeholders for _todoListItems when the application starts:
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
    // This function adds a new instance of TodoListItemData to the _todoListItems
    // list named 'Item X'.
    setState(() {
      this._todoListItems.add(
          TodoListItemData("Item " + (this._todoListItems.length+1).toString(), false, this._removeTodoListItemData)
      );
    });
  }

  void _removeTodoListItemData(TodoListItemData item) {
    // This function deletes a TodoListItemData instance from the _todoListItems
    // list, given the instance as an argument (TodoListItemData item).
    setState(() {
      this._todoListItems.remove(item);
    });
  }

  Widget _buildTodoList() {
    // This returns the ListView.builder that builds the whole ListView containing
    // the TodoListItem widgets:
    return new ListView.builder(
        itemCount: _todoListItems.length,     // The total count in our list of class instances
        itemBuilder: (context, index) {       // The builder itself. Note that this is a function.
          return TodoListItem(
              _todoListItems[index],            // Note that TodoListItem takes TodoListItemData as
              // a parameter.
              ObjectKey(_todoListItems[index])  // Likewise, we would like a key unique to the object
            // instance itself:
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    // The build function that returns the widget for TodoList:
    return Scaffold(
      // We use a scaffold here because we would like to utilize the FloatingActionButton:
      appBar: AppBar(
        title: Text('Flutter To-do List'), // The title of our application
      ),
      body: _buildTodoList(), // The body builds the ListView here
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodoListItemData(); // The FloatingActionButtion calls
          // _addTodoListItemData when pressed.
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class TodoListItemData {
  // The class that stores the data for the TodoListItem widget itself.
  // We use this and not raw strings and booleans so that we could pass
  // an instance of this class itself and change it within the child State, instead
  // of passing `final` data types, making them unchangeable from the child State:
  String itemTitle; // Title of the item
  bool isChecked;   // State of the checkbox
  Function(TodoListItemData) removeSelf; // Function that removes itself from the parent list
  TodoListItemData(this.itemTitle, this.isChecked, this.removeSelf); // Constructor
}

class TodoListItem extends StatefulWidget {
  // The stateful widget for TodoListItem. This represents one to-do list item in our app:
  final TodoListItemData itemData; // Takes in an instance of TodoListItemData

  // The constructor. Note that it also takes in a Key. This key will be used to make itself
  // distinct during building of the ListView:
  TodoListItem(this.itemData, Key key) : super(key: key);

  @override
  _TodoListItemState createState() => _TodoListItemState(itemData);
}

class _TodoListItemState extends State<TodoListItem> {
  // The state itself for TodoListItem:
  TodoListItemData itemData; // We store the instance of TodoListItemData like so
  _TodoListItemState(this.itemData); // The constructor.

  // A TextEditingController for editing the itemTitle of our to-do list:
  TextEditingController itemTitleController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Checkbox(
            value: itemData.isChecked,
            onChanged: (bool value) {
              setState(() {
                itemData.isChecked = value; // Here, we change the state of the checkbox as necessary
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
                      // When the "edit" button is pressed, it launches a dialog containing another
                      // widget: a text field with a save button that performs the necessary
                      // value modifications:
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
                                    // We save the new title here:
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
                      // When the "delete" button is pressed, we delete the item itself
                      // from the parent list using the passed function before:
                      showDialog(
                        context: context,
                        child: AlertDialog(
                          title: Text("Deleting Task.."),
                          content: Text("Are You Sure Want To Proceed ?"),
                          actions: <Widget>[
                            FlatButton(
                                child: Text("Yes"),
                                onPressed: () {
                                  setState(() {
                                    // task is deleted if Yes is pressed
                                    itemData.removeSelf(itemData);
                                  });
                                  Navigator.of(context).pop();
                                }
                            ),
                            FlatButton(
                              child: Text("No"),
                              // goes back to main interface if No is pressed
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );

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
