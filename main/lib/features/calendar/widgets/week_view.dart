import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_left
              ),
            ),
            IconButton(
              onPressed:(){},
              icon: Icon(
                Icons.chevron_right
              ),
            ),
            const SizedBox(width: 16),

            Text('August 10-16, 2026'),


          ], 
        ),
      )
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