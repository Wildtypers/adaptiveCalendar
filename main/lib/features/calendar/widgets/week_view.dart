import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Calendar Header',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/tasks');
            },
            child: Text('Go to Tasks'),
          ),
        ],
      ),
    );
  }
}

class WeekView extends StatelessWidget {
  const WeekView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Center(
        child: Text(
          'Week View',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}