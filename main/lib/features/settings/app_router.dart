import 'package:go_router/go_router.dart';
import 'package:main/features/calendar/calendar.dart';
import 'package:main/features/tasks/tasks.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => CalendarPage(),
    ),
    GoRoute(
      path: '/tasks',
      builder: (context, state) => TasksPage(),
    )
  ]);