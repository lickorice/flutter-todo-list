# Flutter-Firebase Workshop 2

## Quick Review

On our first Flutter-Firebase workshop, we discussed the basics of Flutter

- Flutter is a UI toolkit made by Google for mobile software development.

- Flutter is mainly written in the Dart programming language

- Flutter uses static (Stateless) or dynamic (Stateful) widgets to construct UI

- Widgets can have one or more children widgets, creating a widget tree structure

## Navigation

Create structure by segregating widgets and providing connections

### Routes

- Screens and pages are called routes in Flutter

- Routes create meaningful structure by grouping related widgets together

- The `Navigator` widget stores all the routes inside a stack

  - Only the latest or topmost item in the stack is shown in the UI
  
  - Adding and removing routes changes the UI shown in the screen

- Buttons can use the `Navigator` functions so users can navigate between routes

- Navigate to another route using the `Navigator.push()` function
  
  - Pass the current context and a `MaterialPageRoute` widget
  
  - In the `MaterialPageRoute`, the builder parameter needs a function that takes the current context as its parameter and outputs the desired route
  
  - The `Navigator.push()` function adds a new route to the top of the stack

- To return from the most previous route, simply use the `Navigator.pop()` method
  
  - Pass the current context to `Navigator.pop()`
  - The `Navigator.pop()` function removes the topmost route of the stack
  
  ```dart
  Pass the current context to Navigator.pop()
  The Navigator.pop() function removes the topmost route of the stack
  class FirstRoute extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('First Route'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Open route'),
            onPressed: () {
       Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
        );
            },
          ),
        ),
      );
    }
  }
  
  
  class SecondRoute extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
       Navigator.pop(context);
            },
            child: Text('Go back!'),
          ),
        ),
      );
    }
  }
  
  ```

## Dialog

- Dialogs are pop-ups that can show UI and do actions on top of the current route without taking the entire screen

- Being essentially a pop-up, Dialogs are great for getting confirmation for actions, giving quick alerts, and obtaining data like text inputs

- To display a Dialog, use the `showDialog()` method and pass in the current context and either a `SimpleDialog` , `AlertDialog`, or a `CupertinoAlertDialog` widget
  
  - All Dialogs take a title as an optional parameter that will be shown in its top
  
  - `SimpleDialog` takes and displays a list of `SimpleDialogOptions` widgets, each having an `onPressed` function and one child parameter (commonly Text)
  
  - `AlertDialog` takes one widget to display as its content and an optional list of widgets (commonly Buttons) for its Action parameters
  
  - `CupertinoAlertDialog` are iOS-styled alert dialogs

- Navigator stack also store Dialogs so they can be removed using `Navigator.pop()`

  ```dart
  This snippet shows a method in a State which, when called, displays a dialog box and returns a Future that completes when the dialog   is dismissed.
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap the text button below
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  ```

## Styling

Spice up your flutter app with colors and font styles

### Colors

- Flutter defines color using the `Color` widget
  
  - The Colors widget contains preset colors from Material Design
  
  - It contains primary and accent colors accessible by Colors.primaries and Colors.accents respectively.

- For example, pink can be defined plainly using `Colors.pink`  or with varied intensity like `Colors.pink[500]` or `Colors.pink.shade500` 
  
  - Higher values mean higher intensity for the color.
  
  - For black and white, lower values means greater opacity instead.

- Color can be applied to many widgets through their properties like the color property of a `Container` widget or the color of a `TextStyle` widget

  ```dart
  Colors.primaries; //list of all primary colors
  Colors.accents; //list of all accents
  //These are all equivalent shades of pink.
  Color p = Colors.pink[400]; // defining by preset: pink, intensity 400
  Color i = const Color(0xFFEC407A); // defining by hex code: FF (opacity) + EC407A (pink)
  Color n = const Color.fromRGBO(236, 64, 122, 1.0); // defining by RGB and opacity
  Color k = const Color.fromARGB(255, 236, 64, 122);// defining by alpha and RGB
  Container(
    // a pink container with text
     color: p,
     child: Text(‘Hello World’)
  );

  ```


### Text Styles

- Flutter defines style properties for text using the `TextStyle` widget

- Setting the `TextStyle` properties expectedly affects the text within a widget 
  
  - You can set the `fontSize` (float), fontWeight (`Fontweight`), FontStyle (`FontStyle`) or color (`Colors`) properties of the `TextStyle`

  ```dart
  Text(‘Hello’, style: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.green));

  ```

### Themes

- To provide design consistency and hierarchy, widgets can use Themes

- Themes define a set of colors and fonts that child Widgets can reference

- The whole app can follow one theme by passing a `ThemeData` widget to the theme property of the `MaterialsApp` 
  
  - `ThemeData` defines the theme's colors through its properties, such as`primaryColo` and `accentColor`
  
  - `ThemeData` defines the theme's font styles using the `fontFamily` property and the `textTheme`property
  
  - `textTheme` accepts a `TextTheme` widget which gets`TextStyle` for different text types like `headline1` and `bodyText2`

  ```dart
  MaterialApp(
    title: ‘Sample ThemeData Usage’,
    theme: ThemeData(
    //set default brightness, primaryColor, accentColor, and fontFamily for the app
      brightness: Brightness.light,
      primaryColor: Colors.green,
      accentColor: Colors.green,
      fontFamily: ‘Arial’,
      textTheme: TextTheme(
        //set default styling for the app’s text
	fontSize: 72.0
      )
    )
  );

  ```

- Children widgets can access theme properties using `Theme.of(context)`

- Widgets can have their own themes by wrapping them in a Theme widget
  
  - A `Theme` widget has a data property, which accepts a `themeData` widget, and a child property for applying the theme to a target widget
  
  - The Theme widget can copy the original theme and only overwrite some by `Theme.of(context).copyWith()` and passing certain properties to overwrite

  ```dart
  Container(
    color: Theme.of(context).primaryColor,//gets Colors.greenAccent
    //This will make a copy of its parent widget’s theme with a lighter green accent.
    theme: Theme.of(context).copyWith(accentColor: Colors.greenAccent[100])
  );

  ```
## Resources
*Workshop Lecture:*
Topic: Workshop 2
Start Time : Oct 16, 2020 03:51 PM

Meeting Recording:
https://up-edu.zoom.us/rec/share/OtIivKkdfOcztR0CeuZ0JNebGfzY43x5gn5W-R1xjMMqaR62bOnQSmZOUX15lVLc.CMbNGxRRJf9rUTT-

Access Passcode: R@nz7KJ8

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

### **Carlos Panganiban** - Engineering Team Lead
BS Computer Science, University of the Philippines Diliman \
cgpanganiban@up.edu.ph
