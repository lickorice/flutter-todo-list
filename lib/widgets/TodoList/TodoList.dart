import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Styles
import 'package:flutter_todo_list/styles/styles.dart' as MyStyles;

// Widgets
import '../TodoList/TodoListItem.dart';

class TodoList extends StatefulWidget {
  // TodoList is stateful, since the list itself changes.
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // We initialize a list of TodoListItemData instances, we will build
  // the TodoListItem widgets around these as the TodoList updates
  // its state:
  List<TodoListItemData> _todoListItems;

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
      this._todoListItems.add(TodoListItemData(
          "Item " + (this._todoListItems.length + 1).toString(),
          false,
          this._removeTodoListItemData));
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
    return ScrollConfiguration(
      // Wrapped a scroll configuration widget to apply no glow behavior. Class for it is at the bottom
      behavior: NoGlowBehaviour(),
      child: new ListView.builder(
          itemCount: _todoListItems.length,
          // The total count in our list of class instances
          itemBuilder: (context, index) {
            // The builder itself. Note that this is a function.
            return TodoListItem(
                _todoListItems[index],
                // Note that TodoListItem takes TodoListItemData as
                // a parameter.
                ObjectKey(_todoListItems[
                    index]) // Likewise, we would like a key unique to the object
                // instance itself:
                );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // The build function that returns the widget for TodoList:
    return Scaffold(
      // We use a scaffold here because we would like to utilize the FloatingActionButton:
      appBar: AppBar(
        title: Text('Flutter To-do List', style: MyStyles.textBold,),
        backgroundColor: Colors.white, // The title of our application
        automaticallyImplyLeading: false, // Removes the back button on the appbar
      ),
      body: _buildTodoList(), // The body builds the ListView here
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodoListItemData(); // The FloatingActionButtion calls
          // _addTodoListItemData when pressed.
          // A TextEditingController for editing the itemTitle of our to-do list:
          TextEditingController itemTitleController =
              new TextEditingController();
          showDialog(
            context: context,
            child: AlertDialog(
              title: Text("New Item"),
              content: TextField(
                decoration: new InputDecoration(hintText: "Item title"),
                controller: itemTitleController,
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text("SAVE"),
                    onPressed: () {
                      setState(() {
                        // We save the item title here:
                        _todoListItems[_todoListItems.length - 1] =
                            TodoListItemData(itemTitleController.text, false,
                                this._removeTodoListItemData);
                      });
                      Navigator.of(context).pop();
                    })
              ],
            ),
          );
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

// this one just removes the glow when you scroll down
class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
