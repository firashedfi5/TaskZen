import 'package:go_router/go_router.dart';
import 'package:task_management_app/features/bottom_navbar/presentation/views/custom_bottom_navbar.dart';
import 'package:task_management_app/features/calendar/presentation/views/calendar_screen.dart';
import 'package:task_management_app/features/home/presentation/views/home_screen.dart';
import 'package:task_management_app/features/tasks/presentation/views/new_task_screen.dart';

abstract class AppRouter {
  static const String kHomeScreen = '/homeScreen';
  static const String kCalendarScreen = '/calendarScreen';
  static const String kNewTaskScreen = '/newTaskScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CustomBottomNavbar(),
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kCalendarScreen,
        builder: (context, state) => const CalendarScreen(),
      ),
      GoRoute(
        path: kNewTaskScreen,
        builder: (context, state) => const NewTaskScreen(),
      ),
    ],
  );
}
