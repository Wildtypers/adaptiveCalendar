import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text('Hello World!'),
            TextButton(
              child: Text('Click Me'),
              onPressed:() {

              }
            ),
          ],
        ),
      ),
    );
  }
}