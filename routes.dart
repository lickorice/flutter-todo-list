import 'widgets/HomePage.dart';
import 'widgets/TodoList/TodoList.dart';
import 'widgets/Animations.dart';

var mainAppRoutes = {
  '/': (context) => HomePage(),
  '/todo_list': (context) => TodoList(),
  '/animation_page': (context) => AnimationPage(),
};