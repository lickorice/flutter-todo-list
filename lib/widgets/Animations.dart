import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Tween<double> _scaleTween = Tween<double>(begin: 1, end: 1.5);

    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: _scaleTween,
          duration: Duration(milliseconds: 900),
          builder: (context, scale, child){
            return Transform.scale(scale: scale, child: child);
          },
          child: Container(
          width: 200,
          height: 200,
          color: Colors.lightBlue[200],
          child: Center(
            child: Text(
              'TEST XD',
              // Commenting this out because it throws an error:
              // style: Theme.of(context).textTheme.headline5, 
            ),  //Text
          ),  //Center
        ),  //Container
      ),
    ),  //Center
    );
  }
}

