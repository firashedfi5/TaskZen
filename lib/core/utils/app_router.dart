import 'package:go_router/go_router.dart';
import 'package:task_management_app/features/home/presentation/view/home_screen.dart';

abstract class AppRouter {
  static const String kHomeScreen = '/homeScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      // GoRoute(
      //   path: kHomeScreen,
      //   builder: (context, state) => const HomeScreen(),
      // ),
    ],
  );
}
