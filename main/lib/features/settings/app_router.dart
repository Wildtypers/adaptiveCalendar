import 'package:go_router/go_router.dart';
import '../calendar/calendar.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CalendarPage(),
    ),
  ]);