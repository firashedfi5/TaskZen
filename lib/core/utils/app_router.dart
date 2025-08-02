import 'package:go_router/go_router.dart';
import 'package:task_management_app/features/calendar/presentation/views/calendar_screen.dart';
import 'package:task_management_app/features/home/presentation/views/home_screen.dart';

abstract class AppRouter {
  static const String kCalendarScreen = '/calendarScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: kCalendarScreen,
        builder: (context, state) => const CalendarScreen(),
      ),
    ],
  );
}
