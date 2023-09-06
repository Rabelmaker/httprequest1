import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:httprequest/provider/crew_provider.dart';
// import 'package:httprequest/provider/crew_provider.dart';
import 'package:httprequest/provider/listcrew_provider.dart';
import 'package:httprequest/screen/addcrew.dart';
import 'package:httprequest/screen/listcrew.dart';
import 'package:provider/provider.dart';
// import 'package:httprequest/screen/addcrew.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider(
          create: (context) => ListCrewProvider(),
          child: const ListCrew(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'add',
          builder: (BuildContext context, GoRouterState state) {
            return ChangeNotifierProvider(
              create: (context) => CrewProvider(),
              child: const AddCrew(),
            );;
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

