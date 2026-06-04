import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:table_calendar/table_calendar.dart';

List<String> task = ["Homework1", "Homework2"];

class calendarPage extends StatelessWidget{
  const calendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calander Page')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Back Route'),
              onPressed: () {
                 Navigator.pop(context);// Navigate to second route when tapped.
              },
            ),
            TableCalendar(
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2026, 12, 31),
              focusedDay: DateTime.now(),
              eventLoader: (DateTime date){
                return task;
              },
              onDaySelected: (selectedDay, focusDay){
                
              },
            )
          ]
        )
      ),
    );
  }
}