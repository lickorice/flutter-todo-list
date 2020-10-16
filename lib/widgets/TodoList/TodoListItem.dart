import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_todo_list/styles/styles.dart' as MyStyles;

class TodoListItemData {
  // The class that stores the data for the TodoListItem widget itself.
  // We use this and not raw strings and booleans so that we could pass
  // an instance of this class itself and change it within the child State, instead
  // of passing `final` data types, making them unchangeable from the child State:
  String itemTitle; // Title of the item
  bool isChecked; // State of the checkbox
  Function(TodoListItemData)
      removeSelf; // Function that removes itself from the parent list
  TodoListItemData(
      this.itemTitle, this.isChecked, this.removeSelf); // Constructor
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
  TodoListItemData
      itemData; // We store the instance of TodoListItemData like so
  _TodoListItemState(this.itemData); // The constructor.

  // A TextEditingController for editing the itemTitle of our to-do list:
  TextEditingController itemTitleController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        leading: Checkbox(
            value: itemData.isChecked,
            checkColor: Colors.grey,
            activeColor: Colors.transparent,
            onChanged: (bool value) {
              setState(() {
                itemData.isChecked = !itemData.isChecked;
              });
            }),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(itemData.itemTitle,
                  style: (() {
                    // Ternary operator, this is an if-else block ;)
                    return itemData.isChecked ? MyStyles.textStrikeThrough : MyStyles.textNormal;
                  }())),
              Row(
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
                            decoration:
                                new InputDecoration(hintText: "Item title"),
                            controller: itemTitleController,
                          ),
                          actions: <Widget>[
                            FlatButton(
                                child: Text("SAVE"),
                                onPressed: () {
                                  setState(() {
                                    // We save the new title here:
                                    itemData.itemTitle =
                                        itemTitleController.text;
                                  });
                                  Navigator.of(context).pop();
                                })
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
                                    // Task is deleted if Yes is pressed
                                    itemData.removeSelf(itemData);
                                  });
                                  Navigator.of(context).pop();
                                }),
                            FlatButton(
                              child: Text("No"),
                              // Goes back to main interface if No is pressed
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
