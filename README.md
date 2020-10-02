# Flutter-Firebase Workshop 1
## Introduction
### What is flutter? 
- Flutter is a UI toolkit for mobile software development.
- Flutter was made by Google with the vision of providing a single codebase for huge interfaces.
- Flutter apps are mainly written using the **Dart** language.

### Why use flutter?
- Flutter has a single codebase for a lot of different mobile operating systems (e.g. iOS, Android). This means that when updating features for your apps, you only have to update a single codebase for all different platforms which saves a lot of time.
- It supports a dynamic array of layouts. This means that it can support a huge variation of  screen sizes, especially on the Android platform.

### What is Material Design?
"Material is the metaphor."
- Material is a design system that help teams build high-quality digital experiences for Android, iOS, Flutter, and the web.
- Material Design is inspired by the physical world and its textures, including how they reflect light and cast shadows. Material surfaces reimagine the mediums of paper and ink.

## Widgets
In Flutter, everything is a widget. Even your app itself is a widget.

### Definition of a Widget
- In flutter, using widgets is a way to declare and construct UI.
- A widget might display something, it might help define design, it might help with layout, it may handle user interaction, etc.
- It can be said that a widget is a blueprint. Flutter uses these blueprints to create views.

### The Widget Tree
- Widgets are arranged into a tree of parent and child widget.
- Widgets are nested inside of each other to form your app.
- The entire widget tree forms a layout that you see on the screen.

### Stateless Widgets
- In simple words, **if a widget doesn’t do anything, then it is a stateless widget.** They are static in nature.
- You can also say that stateless widgets are “dataless” widgets. As they don’t store any real-time data.
- For example, if you have a simple `Text` widget on the screen, and since it doesn’t do anything, then it is a stateless widget.

### Stateful Widgets
- In simple words, **if a widget does anything then it is a stateful widget.**
- A stateful widget is dynamic in nature. That means it can keep track of changes and update the UI based on those changes.
- The user can interact with a stateful widget. For example, If you press a `Button` and it performs a task, then it's a Stateful Widget.
- `CheckBox`, `Radio`, `Slider`, `InkWell`, `Form`, and `TextField` are an example of stateful widgets.

### Layout Widgets
- All layout widgets have either a child property, if they take a single child, or a children property if they take a list of widgets.
- `Row`, `Column`, and `Container` are examples of layout widgets.

## Credits
The original source code is forked from [Carlos Panganiban's repository here](https://github.com/lickorice/flutter-todo-list). This README is provided by the Tech Education team.
