import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Styles
import 'package:flutter_todo_list/styles/styles.dart' as MyStyles;

class AnimatedTodoList extends StatefulWidget {
  @override
  _AnimatedTodoListState createState() => _AnimatedTodoListState();
}

class _AnimatedTodoListState extends State<AnimatedTodoList> {
  final GlobalKey<AnimatedListState> _animatedListKey =
      GlobalKey<AnimatedListState>();
  List<String> _animatedTodoListItems;

  @override
  void initState() {
    super.initState();
    _animatedTodoListItems = [
      "Item 1",
      "Item 2",
      "Item 3",
      "Item 4",
      "Item 5",
    ];
  }
  String _getNextItemTitle() {
    return "Item " + (this._animatedTodoListItems.length + 1).toString();
  }

  Widget _slidingItem(BuildContext context, int index, Animation animation) {
    String item = _animatedTodoListItems[index];
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset(0, 0),
        ).animate(animation),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(item),
              IconButton(
                onPressed: () {
                  setState(() {
                    _animatedListKey.currentState.removeItem(
                      index, (_, animation) => _slidingItem(context, index, animation),
                      duration: const Duration(milliseconds: 500)
                    );
                    _animatedTodoListItems.removeAt(index);
                  });
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Animated To-do List',
          style: MyStyles.textBold,
        ),
        backgroundColor: Colors.white, // The title of our application
        automaticallyImplyLeading:
            false, // Removes the back button on the appbar
      ),
      body: AnimatedList(
          key: _animatedListKey,
          initialItemCount: _animatedTodoListItems.length,
          itemBuilder: (context, index, animation) {
            return _slidingItem(context, index, animation);
          }), 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
          _animatedListKey.currentState.insertItem(
            _animatedTodoListItems.length,
            duration: const Duration(milliseconds: 500)
          );
          _animatedTodoListItems = []..addAll(_animatedTodoListItems)..add(_getNextItemTitle());          
          });
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
