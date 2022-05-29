import 'package:digital14/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/event_details/event_details.dart';

// final artistsProvider = ArtistsProvider();
// final playlistsProvider = PlaylistsProvider();

const List<NavigationDestination> destinations = [
  NavigationDestination(
    label: 'Home',
    icon: Icon(Icons.home),
    route: '/',
  ),
  NavigationDestination(
    label: 'Playlists',
    icon: Icon(Icons.playlist_add_check),
    route: '/playlists',
  ),
  NavigationDestination(
    label: 'Artists',
    icon: Icon(Icons.people),
    route: '/artists',
  ),
];

class NavigationDestination {
  const NavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Icon icon;
  final Widget? child;
}

final appRouter = GoRouter(
  // navigatorBuilder: (context, state, child) => PlayPauseListener(child: child),
  routes: [
    // HomeScreen
    GoRoute(path: '/', builder: (context, state) => const MyHomePage()),
    GoRoute(
      name: 'details',
      path: '/details',
      builder: (context, state) => const EventDetailsView(showBackButton: true),
    ),
  ],
);
