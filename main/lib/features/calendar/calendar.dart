import 'package:flutter/material.dart';
import 'package:main/features/calendar/widgets/week_view.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            CalendarHeader(),
            Expanded(
              child: WeekView(),)
          ],
        ),
      ),
    );
  }
}