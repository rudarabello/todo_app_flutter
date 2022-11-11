import 'package:flutter/material.dart';
import 'package:todo_app_flutter/features/home/home_states.dart';

import '../home_controller.dart';

class ConstructWidgetOnPage extends StatelessWidget {
  final HomeController controller;
  const ConstructWidgetOnPage({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: ((context) {
        if (controller.state is HomeStateLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.state is HomeStateError) {
          return const Center(
            child: Text('Ops, houve um erro'),
          );
        } else {
          return ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              final item = controller.todos[index];
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.description),
              );
            },
          );
        }
      }),
    );
  }
}
