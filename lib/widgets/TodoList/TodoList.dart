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
  final _animKey = GlobalKey<AnimatedListState>();

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

  void _addTodoListItemData(String itemTitle) {
    // This function adds a new instance of TodoListItemData to the _todoListItems
    // list named 'Item X'.
    _animKey.currentState.insertItem(_todoListItems.length,
        duration: const Duration(milliseconds: 500));
    setState(() {
      this._todoListItems.add(
          TodoListItemData(itemTitle, false, this._removeTodoListItemData));
    });
  }

  void _removeTodoListItemData(TodoListItemData item) {
    // This function deletes a TodoListItemData instance from the _todoListItems
    // list, given the instance as an argument (TodoListItemData item).
    int itemIndex = _todoListItems.indexOf(item);
    _animKey.currentState.removeItem(itemIndex,
        (context, animation) => _buildItem(item, itemIndex, animation),
        duration: const Duration(milliseconds: 500));
    setState(() {
      this._todoListItems.remove(item);
    });
  }

  String _getNextItemTitle() {
    return "Item " + (this._todoListItems.length + 1).toString();
  }

  Widget _buildTodoList() {
    // This returns the ListView.builder that builds the whole ListView containing
    // the TodoListItem widgets:
    return ScrollConfiguration(
        // Wrapped a scroll configuration widget to apply no glow behavior. Class for it is at the bottom
        behavior: MyStyles.NoGlowBehaviour(),
        child: AnimatedList(
          key: _animKey,
          itemBuilder: (context, index, animation) =>
              _buildItem(_todoListItems[index], index, animation),
          initialItemCount: _todoListItems.length,
        ));
  }

  Widget _buildItem(item, int index, Animation<double> animation) {
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset(0, 0),
        ).animate(animation),
        child: TodoListItem(item, ObjectKey(item))
      );
  }

  @override
  Widget build(BuildContext context) {
    // The build function that returns the widget for TodoList:
    return Scaffold(
      // We use a scaffold here because we would like to utilize the FloatingActionButton:
      appBar: AppBar(
        title: Text(
          'Flutter To-do List',
          style: MyStyles.textBold,
        ),
        backgroundColor: Colors.white, // The title of our application
        automaticallyImplyLeading:
            false, // Removes the back button on the appbar
      ),
      body: _buildTodoList(), // The body builds the ListView here
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // A TextEditingController for editing the itemTitle of our to-do list:
          TextEditingController itemTitleController =
              new TextEditingController();
          itemTitleController.text = _getNextItemTitle();
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
                    child: Text("CANCEL", style: MyStyles.textRed),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                FlatButton(
                    child: Text("SAVE"),
                    onPressed: () {
                      setState(() {
                        // We save the item title here:
                        _addTodoListItemData(itemTitleController.text);
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
