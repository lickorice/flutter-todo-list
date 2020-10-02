# Flutter-Firebase Workshop 1
#### What is flutter? 
- Flutter is a UI toolkit for mobile software development.
- Flutter was made by Google with the vision of providing a single codebase for huge interfaces.
- Flutter apps are mainly written using the **DART** language.
- Flutter has a single codebase for a lot of different mobile operating systems (e.g. iOS, Android)


#### Why use flutter?
- Flutter has a single codebase for a lot of different mobile operating systems (e.g. iOS, Android). This means that when updating features for your apps, you only have to update a single codebase for all different platforms which saves a lot of time.


- It supports a dynamic array of layouts.This means that it can support a huge variation of  screen sizes, especially on the Android platform.

#### What is Material Design?
"Material is the metaphor."
- Material is a design system that help teams build high-quality digital experiences for Android, iOS, Flutter, and the web.
- Material Design is inspired by the physical world and its textures, including how they reflect light and cast shadows. Material surfaces reimagine the mediums of paper and ink.



## Widgets
#### Definition of a Widget
- In flutter, Widget is a way to declare and construct UI.
- A widget might display Something, it might help define design, it might help with layout, it may handle user interaction, etc.
- So you can consider that a widget is a blueprint. Flutter uses these blueprints to create views.

**In flutter everything is a widget. Even your app itself is a widget.**

#### The Widget Tree
- Widgets are arranged into a tree of parent and child widget.
- Widgets are nested inside of each other to form your app.
- The Entire widget tree forms a layout that you see on the screen.


#### Stateless Widget
- In simple words, **if a widget doesn’t do anything its Stateless Widget.** They are static in nature.
- Stateless widgets don’t store any state. That means they don’t store values that might change.
- You can also say that stateless widgets are “DATALESS” widgets. As they don’t store any real-time data.
- For example, if you have a simple *Text widget* on the screen, but it doesn’t do anything then its Stateless Widget.
- Icon, IconButton, and Text are an example of stateless widgets.


#### Stateful Widget
- In simple words, **if a widget does anything then its Stateful Widget.**
- A Stateful widget is dynamic in nature. That means it can keep track of changes and update the UI based on those changes.
- The user can interact with a stateful widget. For example, If you press a button and it performs any task its a Stateful Widget, If you are moving a slider and it does anything then its a Stateful Widget, If you swipe item from a list and item gets deleted then that list a Stateful Widget.
- `CheckBox`, `Radio`, `Slider`, `InkWell`, `Form`, and `TextField` are an example of stateful widgets.


#### Building Layouts
- All layout widgets have either a child property, if they take a single child, or a children property if they take a list of widgets.
- Most widgets have a build() method. Instantiating and returning a widget in the app’s build() method displays the widget.


### The `Container` Widget
- A **`Container`** allows you to customize it’s child widget. Use it when you want to add padding, margins and borders to name some of the things you can do with it.

### Examples of Visible Widgets:
#### Text Widget: 
Text('Hello World'),


#### Image Widget:
```dart
Image.asset(
  'images/lake.jpg',
  fit: BoxFit.cover,
),
```
#### Icon Widget:
```dart
Icon(
  Icons.star,
  color: Colors.red[500],
),

// You can add visible widgets to layout widgets like this:
Center(
  child: Text('Hello World'),
),
```

The visible text widget is added here to the layout Center widget

Most widgets have a `build()` method.  Instantiating and returning a widget in the app’s `build()` method displays the widget.

### Adding Layout Widgets
#### For Material Apps

- **`Scaffold`** is a layout class used in Material Apps that expands or occupies in the whole device screen.
- `Scaffold` provides a framework to implement the basic material design layout of the application.

For Material apps you can use a Scaffold widget first, this provides default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. You can add the center widget from the last example directly to the the body property of the home page like so:

```dart
class MyApp extends StatelessWidget {
 @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```

#### For Non-Material Apps
You must add them directly to the app's build method. There will not be default features such as banners or background color, you will have to add them in yourself. 

For non-material apps, you can add the center widget to the app’s build method. Non material apps do not contain an appbar title or background cover, you will have to build them yourself like this:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          'Hello World',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
```

### Lay out multiple widgets vertically and horizontally
- A child widget can be a row, column or other complex widget. You can specify how a row or column aligns its children. You can stretch or constrain specific child widgets. You can specify how child widgets use the row or column’s available space.

- A **`Row` Widget** arranges your widgets **horizontally**.

- A **`Column` Widget** arranges your widgets **vertically.**

 - When layout is too large for the screen, a yellow and black striped pattern appears along the affected edge.

Use the **`Expanded`** widget to fix this. Widgets can be sized to fit a row or column using the `Expanded` widget. If you want a widget to to occupy more space compared to its siblings, alter the flex property of the **`Expanded`** widget

#### Constraints
The Golden Rule: **Constraints go down. Sizes go up. Parent sets position.**

##### How Constraints get their rules from their parent:
- A widget gets its constraints from its parent. A constraint is a set of four values minimum and maximum width, and a minimum and maximum height.
- Widget tells its children one by one what it’s constraints are, then asks each child what size it wants to be.
- Widget positions each of its position one by one
- Finally, widget tells its own parent what size it is, within its own constraint of course.
- A widget can’t have any size it wants.
- A widget can’t know and cant decide its own position on the screen.
- You can not precisely define the size and position of a widget without considering the entire tree as a whole. This is because a widget takes it’s constraints from its parent.

### Commands to know
#### Downloading packages:
1.Find the `pubspec.yaml`. This manages all the assets and dependencies you might want to use when building your app. A list of open source packages are available at the pub.dev website
2.Add your desired package to the dependencies list  in the `pubspec.yaml` file
3.Run the command `flutter pub get` from the console. This installs your desired package
4.You can now use the package in your app by adding it in `lib/main.dart`

#### Adding Stateful and Stateless Widgets
Type `stless` in the editor to create a stateless widget
Type `stful` in the editor to create a stateful widget

#### Android Studio Specific Shortcuts and Tips:
Pressing `Alt+Enter` while hovering over the name of the widget, lets you see all possible options you have for editing or adding to the widget. 
Examples include:
Converting a Stateless Widget into a Stateful Widget
Adding padding around a widget
Wrapping a widget with a Container, Column, or Row or any other widget.
Removing a Widget Entirely

Helpful Tip: You don't have to highlight a whole line line of code to copy or cut it. Simply put your cursor at the end of the line and copy and cut as normal with the Crtl+C and Crtl+X shortcuts. Paste with Crtl+V

Source Code
If you want to know what goes on behind a certain widget or class, select it with your cursor and press Crtl+B to see the source code.

Checking a widget's Properties
If you want to see your widget's properties without leaving the file or tab, simply press  Crtl+Shift+I

Selecting an Entire Widget
You can select an entire widget without highlighting all the lines by pressing Crtl+W while selecting the widget's name.

Fix Code Structure.
If your code starts to look messy, press Crtl+Alt+L to fix the indentation and reformat your code

Flutter Outline
Not a command but to see the entire outline of your code and widget structure, especially when it gets complicated, look for the flutter outline tab at the top right of the Android Studio Application.

With Flutter outline you can do a number of other things including:
1. Move children widgets up or down in their parent's tree if you need to reorder them.
2. You can make extract code to create a custom method for buiding an entirely new widget

Refactor Renaming
You can rename a class,widget, file name or method by pressing shift+F6 while selecting it.

Remove Unused Imports
You can remove unused imports and packages by pressing Crtl+Alt+O

### To-Do List classes

1. `class MyApp`

a. The declaration of class MyApp includes a part which says "extends StatelessWidget". You can see the "extends" keyword again for the other classes. The "extends" keyword creates a "subclass" which means all the properties and functions available to the "superclass" also becomes available to our class(which is the subclass). So in the case of the first function, the properties and functions of the class "StatelessWidget" also become available to our class "MyApp". 
Aside from this, "StatelessWidget" and "StatefulWidget" also extends "Widget". This means when you look at the documentation for Flutter functions, let's say the runApp() function, and see that it takes an input with a datatype "Widget", you can use your created class "MyApp" as an input because "MyApp" is a subclass of "StatelessWidget" which is a subclass of the class "Widget". 
If you haven't encountered classes before, it's fine if it doesn't all make sense. I just wanted to say that you can treat the classes you create which "extends StatelessWidgets" or "extends StatefulWidgets" as having the datatype "Widget".

b. In the MyApp class we also have a build() method which returns the TodoList() widget.

The next two classes are the TodoList class and the _TodoListStateclass

2. class TodoList 
a. The only content of this class is that it calls the createState() function from the class "State"
b. This is done because the Widget class is "immutable". Immutable means you can't change or modify the properties of the class, in this case the TodoList class.
c. What the createState() function does is it creates a "mutable" state for this widget or it returns an object of class "State" which is a "mutable" object.

3. class _TodoListState
a.  The  _TodoListState contains the "list" (_todoList) where we will store the "tasks" in our To Do List app.
b. By default, it creates a list with 5 "tasks" but it will still work if you start with an empty list. 
c. The class contains two functions, the _addTodoListItem() and _removeTodoListItem(item), which is used to add and remove items from the list. Inside these functions, we can see that it uses the "setState()" function before executing succeeding lines. What the "setState()" function does is it triggers a rebuild of the Widget tree. This is done whenever there is a change in our user interface. In this case when a new "task" gets added or when a "task" gets deleted. The _addTodoListItem() and _removeTodoListItem(item) functions would be used later for the buttons we'll create later. 
d. The class contains a "Widget" called _buildTodoList(). What it does is it creates and returns a "ListView" class. The "ListView" class is used to display the elements of our "list". The _buildTodoList() widget will be used later in the build() method.
e. Finally, the _TodoListState class contains our build() method. The build() method describes the part of the user interface represented by the widget. or it's the part which we can see in our app. In our case, the build() method returns a MaterialApp() which uses a Scaffold(). The Scaffold() uses its "appBar", "floatingActionButton", and "body" properties. 
	- The appBar just contains a "Text" widget used to display the name of our app.
	- The floatingActionButton property uses a FloatingActionButton() widget and when pressed it calls the _addTodoListItem() function. It also contains an "Icon" widget as its child.
	- The body property contains a Center() widget and inside we used the _buildTodoList() widget which we described earlier. 

4. class TodoListItem
a. This class represents a single "task" in our "list". 
b. The class contains a "String" variable and a "Function" which is used to remove the current item. 
c. Like the TodoList class, it also uses the createState() function

5. class _TodoListItemState
a. This class is used to describe how each element in our list would appear in our user interface.
b. Just like the previous class, it contains a "String" variable and a "Function". 
c. By looking at its build() method we can see that it uses a series of Row widgets in order to properly display a checkbox, the name of the "task", a button used to edit the name of the "task", and a button used to remove the task. 
d. Row and Column Widgets’ “children” property expects a List of Widgets. Even though it's called "children", the property only accepts one list of datatype Widgets. The benefit of referring to a list as opposed to directly hardcoding a list of widgets in the children property of rows and columns is because we can now add and remove elements in our list.



## References
 - [First steps with Flutter: Exploring widgets](https://pusher.com/tutorials/flutter-widgets)
 - [4. What is Widget in flutter ? Let's clear the basics first.](https://medium.com/jay-tillu/4-what-is-widget-in-flutter-lets-clear-the-basics-first-82f501c8d0f0)
 - [First steps with Flutter: Building layouts](https://pusher.com/tutorials/flutter-building-layouts)
 - [Material Design](https://material.io/design/introduction#principles)
 - [IDE shortcuts for adding widgets](https://medium.com/flutter-community/flutter-ide-shortcuts-for-faster-development-2ef45c51085b)
 - [Layouts in flutter](https://flutter.dev/docs/development/ui/layout)
