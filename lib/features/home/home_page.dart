import 'package:todo_app_flutter/design_system/my_color.dart';
import 'package:todo_app_flutter/features/home/home_controller.dart';
import 'package:todo_app_flutter/features/home/widgets/constructWidgetOnPage.dart';
import 'package:todo_app_flutter/models/todo_model.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;
  late Widget body;
  final pageController = PageController();

  void changePage(int index) {
    pageController.jumpToPage(index);
  }

  void _close() {
    Navigator.of(context).pushReplacementNamed('login');
  }

  @override
  void initState() {
    super.initState();
    controller = HomeController(() => setState(() {}));
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.darkGrey,
        title: Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ConstructWidgetOnPage(controller: controller),
          Container(
            color: MyColor.black,
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  controller.logout();
                  _close();
                },
                child: const Text('Logout'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).pushNamed<TodoModel>(
            'create-todo',
            arguments: 'create new task',
          );
          if (result != null) {
            controller.addTodo(result);
          }
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: MyBottomBar(changePage: changePage),
    );
  }
}
