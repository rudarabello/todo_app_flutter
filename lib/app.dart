import 'package:todo_app_flutter/design_system/app_theme.dart';
import 'package:todo_app_flutter/features/authentication/splash.dart';
//import 'package:todo_app_flutter/features/home/home_page.dart';
import 'package:todo_app_flutter/features/login/login_page.dart';
//import 'package:todo_app_flutter/model/todo_model.dart';
import 'package:flutter/material.dart';

//import 'features/create_todo/create_todo.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      home: const SplashPage(),
      routes: {
        'splash': (context) => const SplashPage(),
        'login': (context) => LoginPage(),
        // 'home': (context) => const HomePage(title: Todo App),
        // 'create-todo': (context) => CreateTodo(),
      },
    );
  }
}
