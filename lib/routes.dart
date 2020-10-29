import 'widgets/HomePage.dart';
import 'widgets/TodoList/TodoList.dart';
import 'widgets/Animations.dart';
import 'widgets/AnimatedTodoList.dart';

var mainAppRoutes = {
  '/': (context) => HomePage(),
  '/todo_list': (context) => TodoList(),
  '/animation_page': (context) => AnimationPage(),
  '/animated_todo_list': (context) => AnimatedTodoList(),
};