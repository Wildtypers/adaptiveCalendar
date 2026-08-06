import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Hello World!'),
          TextButton(
            child: Text('Click Me'),
            onPressed:() {
              context.go('/');
            }
          ),
        ],
      ),
    );
  }
}