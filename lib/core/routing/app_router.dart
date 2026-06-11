import 'package:go_router/go_router.dart';
import '../../features/home/screens/main_scaffold.dart';
import '../../features/auth/screens/login_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScaffold(),
    ),
  ],
);
