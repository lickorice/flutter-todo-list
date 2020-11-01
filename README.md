# Flutter-Firebase Workshop 3

## Resources
- Lecture Recording : https://docs.google.com/presentation/d/1x4adqqpfrgIA5r5paBsDFeGyBGL7KLQ8-LRFY5mg_WE/edit?usp=sharing


- Powerpoint : https://docs.google.com/presentation/d/1x4adqqpfrgIA5r5paBsDFeGyBGL7KLQ8-LRFY5mg_WE/edit?usp=sharing

## Quick Review

During the second workshop, we covered Navigation.

- Navigation connects and segregates widgets to create a structured output.

- Screens and pages are called Routes in Flutter. Routes weaves related widgets to create meaningful structures.

- Dialogs are pop-ups that can show UI and do actions(eg. action confirmation, obtaining data, etc.) on top of the current route without taking the entire screen.

- To enhance user experience, Flutter also offres a wide range of colors and font styles to spice up your app!

## Implicit Animations

- Basic custom and built-in Flutter widgets that can be given animation parameters.

- Used for single widgets with straightforward and non-repeating animations.

- No animation controllers are needed; Flutter’s animation library handles the animations.

- Only need to wrap target widget to be animated in an `AnimatedFoo` widget.

- Different `AnimatedFoo` containers exist for different animations and widgets:
  - `AnimatedContainer` : the same as the basic `Container` widget, but has a required `duration` parameter to set animation duration. Commonly used to resize or change the color of the `child` widget.

  - `AnimatedOpacity` : a widget used to specifically animate the opacity and create a fading effect of `child` widgets.

  - `AnimatedPadding` : a widget that only animates the padding.

  - `AnimatedSwitcher` : a widget that is wrapped in this may be switched or transitioned into another widget by setting the state.

  - `AnimatedList` : a list container that can animate list insertions and deletions.


### Steps in Using AnimatedFoo

- Wrap a widget to be animated in an `AnimatedFoo` container. Note that the widget must be stateful to have animations in the transitions between states.

- Set the duration of the animations in the `duration` parameter of the `AnimatedFoo` container.

- (Optional) Set the transition timings using the `curve` parameter.

- In the `State` class of the stateful widget, declare the variable properties (i.e. `height`, `width`, `color`) that will be animated. In the `AnimatedFoo` container, set its properties to be the previously declared state variables.

- When changing states using `setState()`, changing state variables will automatically result in animations during the transition.

  
  ```dart
  // Sample Animated Column Widget
  class _SampleAnimatedFooState extends State<SampleAnimatedFoo> {

  // 4. Set properties that need to be animated
    double _height = 80;
    double _width = 160;
    Color _color = Colors.blue;

    @override
    Widget build(BuildContext context) {

    // 1. Wrap the widget to be animated in an AnimatedFOO container
      return AnimatedContainer(

      // 2. Set the duration of all animations
        duration: Duration(milliseconds: 900),

      // 3. Optional: set the transition timings of animations
        curve: Curves.easeIn,

      // Set properties to be animated
      // Note: these properties should have initial values set in the State
        height: _height,
        width: _width,
        color: _color,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text('Hello World!'),
            RaisedButton(
              child: Text('Animate!'),
              onPressed: () {

              // 5. Change state properties and animations occur automatically!
                setState(() {
                  if(_color == Colors.blue) {
                    _height = 160;
                    _width = 320;
                    _color = Colors.green;
                  } else {
                    _height = 80;
                    _width = 160;
                    _color = Colors.blue;
                  }
                });
              },
            )
          ],
        ),
      );
    }
  }
  ```
## Tweens and TweenAnimationBuilder

- `TweenAnimationBuilder` is a widget builder used to create custom implicit animations that don’t have a built-in `AnimatedFoo` widget, or combine multiple animations in one builder.

- Has a required parameter `tween` which creates a linearly interpolated list of values between specified beginning and end values
The evenly-spaced values in the `tween` are used to smoothly animate the widget.

- There are different kinds of tweens for different kinds of data:
  - `Tween<double>` : Basic `tween` that creates a linear interpolation between two values.

  - `ColorTween` : interpolation between two different colors.

  - `RectTween` : interpolation between two rectangles.

### Steps in Using Tween Animations
- Create and return a `TweenAnimationBuilder` in lieu of the widget to be animated.

- Set the `tween`. (i.e. `Tween<double> (begin: 0, end: 1)`).

- Set the `duration` of the animation.

- (Optional) Set a child that does not depend on tween values. This is usually done for performance considerations.

- Set up the `builder` for the `TweenAnimationBuilder`. Take note that the second argument for the `builder` will be the `tween`, so it should always have the same datatype.

- Inside the `builder`, return the original or child widget with its properties modified to use the `tween` values.

  ```dart
  // Sample Animated Text using Tweens
  class _SampleTweenState extends State<SampleTween> {
    @override
    Widget build(BuildContext context) {

    // 1. Create a TweenAnimationBuilder
      return TweenAnimationBuilder(

        // 2. Set the tween: the values that will be interpolated
          tween: Tween<double>(begin: 0, end: 1),

        // 3. Set the duration of the animation
          duration: Duration(milliseconds: 900),

        // 4. (Optional) Set a child that does not depend on tween values

        // 5. Set up the builder for the animated widget
          builder: (BuildContext context, double _tween, Widget child) {

          // 6. Inside the builder, modify widget properties using the tween
            return Padding(
              padding: EdgeInsets.only(top: 200 - 200 * _tween),
              child: Opacity(
                opacity: _tween,
                child: Text(
                  'Hello World!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50 * _tween,
                  ),
                ),
              ),
            );
          },
      );
    }
  }
  ```

## Animation Controller

- `AnimationController` gives full control of the animation to the coder.

- Properties include the `duration` which dictates how long the animation will be; accepts the `Duration` object as its parameter.

- Another important property is the `vsync`. `vsync` synchronizes the controller with an animation ticker. The ticker that we synchronize it with is the widget itself; thus, we need the mixin `SingleTickerProviderStateMixin` to do just that. This reduces the unnecessary resources used in the background when running the app.

- Letting the targeted widget to be the ticker for `vsync` means that it will only be active when the given widget is active.


### Steps in using Animated Controller
- Initialize `AnimationController` and give it a name.

- You can directly input the value in the same line or use the `initState` to update the value of `AnimationController`.

- Specify the duration of the animation of the widget you are trying to control.

- Set `vsync` to `this` to synchronize the controller to the Stateful Widget that we use it with. 

- Include the `SingleTickerProviderStateMixin` to give the widget the ability to act as the ticker for the `vsync`.

  ```dart
  class _StateName extends State<WidgetName> with SingleTickerProviderStateMixin { //5. Include the `SingleTickerProviderStateMixin` to give the widget the ability to act as the ticker for the `vsync`.
    // 1. Initialize `AnimationController` and give it a name.
    AnimationController _controller;

    @override
    //2. You can directly input the value in the same line or use the `initState` to update the value of `AnimationController`.
    void initState() {
      super.initState();

      _controller = AnimationController(
        //3. Specify the duration of the animation of the widget you are trying to control.
        duration: Duration(length)
        //4. Set `vsync` to `this` to synchronize the controller to the Stateful Widget that we use it with. 
        vsync = this
      )
    }
  }
  ```

## Animation Object and FooTransition

### Animation Object

- In Flutter, an Animation object knows nothing about what is onscreen. 

- `Animation` : an abstract class that understands its current value and its state (completed or dismissed). One of the more commonly used animation types is `Animation<double>`.

- Animations can also interpolate types other than double, such as `Animation<Color>` or `Animation<Size>`.

- Animation Objects are used for Transition Widgets or FooTransitions.

### FooTransition

- Foo is the name of the non-animated version of that widget. 

- `FooTransition` is the animated widget and is similar to AnimatedFoo.

- They are already made and only require you to provide an animated object. 

  ```dart
    // Sample FadeTransition
    FadeTransition(
    opacity: animation,
    child: Text(widget.text.)
    );

    // Sample AnimationController
    final controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
    );

    // Sample Animation
    final animation = Tween(
    being: 0.0,
    end: 1.0,
    ).animate(controller);

    // Starting the transition
    controller.forward();
    ```


## Credit

The code included in this repository was written by the **Developer Resources Team 2020**:

### **Luiz Agana** - Team Leader
BS Computer Science, University of the Philippines Diliman \
lcagana@up.edu.ph

### **Clynt Uy** - Team Member
BS Computer Engineering, University of the Philippines Diliman \
clyntuy45@gmail.com

### **Sophia Ricarte** - Team Member
BS Computer Science, University of the Philippines Diliman \
acricarte@up.edu.ph

### **Coleen Quirim** - Team Member
BS Computer Science, University of the Philippines Diliman \
coleenquirim@gmail.com

### **Annysia Dupaya** - Tech Education Lead
BS Computer Science, University of the Philippines Diliman \
dupayag@gmail.com	

### **Carlos Panganiban** - Engineering Lead
BS Computer Science, University of the Philippines Diliman \
cgpanganiban@up.edu.ph
