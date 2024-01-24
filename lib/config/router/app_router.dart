import 'package:go_router/go_router.dart';
import 'package:medi_meet/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/register',
      builder: (context, state) => const SingInScreen(),
    ),

    GoRoute(
      path: '/tutorialApp',
      builder: (context, state) => const TutorialAppScreen(),
    ),

  ]
);