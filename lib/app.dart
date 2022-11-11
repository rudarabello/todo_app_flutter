import 'package:todo_app_flutter/design_system/app_theme.dart';
import 'package:todo_app_flutter/features/splash/splash_page.dart';
import 'package:todo_app_flutter/features/home/home_page.dart';
import 'package:todo_app_flutter/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/models/todo_model.dart';
import 'features/create_todo/create_todo.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      home: const SplashPage(),
      routes: {
        'splash': (context) => const SplashPage(),
        'home': (context) => const HomePage(title: 'Todo App'),
        'login': (context) => LoginPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == 'create-todo') {
          return MaterialPageRoute<TodoModel>(
            builder: (context) => CreateTodo(),
          );
        }
        return null;
      },
    );
  }
}
