import 'package:go_router/go_router.dart';
import 'package:medi_meet/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/noticia/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '0';
        return NoticiaScreen(id: id,);
      },
    ),

    GoRoute(
      path: '/especialidad/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '0';
        return EspecialidadScreen(id: id,);
      },
    ),

    GoRoute(
      path: '/home',
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