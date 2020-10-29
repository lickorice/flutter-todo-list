import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // In a vertical column:
      body: Column(
        // Center-aligns the children:
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // The title:
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Todo List",
                style: TextStyle(
                  //applies style to your text
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // The enter button:
          EnterButton(75, 150, '/todo_list'),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Animated Todo List",
                style: TextStyle(
                  //applies style to your text
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // The enter button
          EnterButton(40, 150, '/animated_todo_list'),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Animations",
                style: TextStyle(
                  //applies style to your text
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // The enter button
          EnterButton(40, 150, '/animation_page'),
        ],
      ),
    );
  }
}

class EnterButton extends StatefulWidget {
  @override

  final double height, width;
  final String route;

  EnterButton(this.height, this.width, this.route);

  _EnterButtonState createState() => _EnterButtonState();
}

class _EnterButtonState extends State<EnterButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          // Go to the to-do list here:
          Navigator.pushNamed(context, widget.route);
        });
      },
      child: Center(
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            color: Color(0xFF42A5F5),
            borderRadius: BorderRadius.all(
                Radius.circular(10.0) // Value is border radius
            ),
          ),
          child: Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 30),
        ),
      ),
    );
  }
}
