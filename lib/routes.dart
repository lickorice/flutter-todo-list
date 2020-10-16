import 'widgets/HomePage.dart';
import 'widgets/TodoList.dart';

var mainAppRoutes = {
  '/': (context) => HomePage(),
  '/todo_list': (context) => TodoList(),
};