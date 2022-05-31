import 'package:go_router/go_router.dart';
import 'package:digital14/features/event_details/event_details.dart';
import 'package:digital14/pages/pages.dart';

final appRouter = GoRouter(
  routes: [
    /// Home Screen
    GoRoute(path: '/', builder: (context, state) => const MyHomePage()),

    /// Event Details Screen
    GoRoute(
      name: 'details',
      path: '/details',
      builder: (context, state) => const EventDetailsView(showBackButton: true),
    ),
  ],
);
