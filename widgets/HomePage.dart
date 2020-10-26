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
          EnterButton(),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Animations",
                style: TextStyle(
                  //applies style to your text
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // The enter button
          AnimationButton(),
        ],
      ),
    );
  }
}

class EnterButton extends StatefulWidget {
  @override
  _EnterButtonState createState() => _EnterButtonState();
}

class _EnterButtonState extends State<EnterButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          // Go to the to-do list here:
          Navigator.pushNamed(context, '/todo_list');
        });
      },
      child: Center(
        child: Container(
          width: 150.0, 
          height: 60.0,
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

class AnimationButton extends StatefulWidget {
  @override
  _AnimationButtonState createState() => _AnimationButtonState();
}

class _AnimationButtonState extends State<AnimationButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          // Go to the to-do list here:
          Navigator.pushNamed(context, '/animation_page');
        });
      },
      child: Center(
        child: Container(
          width: 150.0,
          height: 60.0,
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
