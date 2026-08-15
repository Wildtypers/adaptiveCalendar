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

            Spacer(),

            Text('Today'),

            const SizedBox(width: 16),

            ElevatedButton(
              child: Text('Create Task'),
              onPressed: () {},
            ),
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
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 24),
            ...[
              'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'
            ].map((day) => Expanded(
              child: Column(
                children: [
                  Text(day),
                  Row(
                    children:[
                      Expanded (
                        child: Container(
                          height: 60, 
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                        )
                      )
                    ]
                  )
                ]
              ),
            ))
          ],
        ),
        Expanded(
          child: Container(
            color: Colors.grey[200],
            child: Center(
              child: Text('Week View Content'),
            ),
          ),
        ),
      ],
    );
  }
}