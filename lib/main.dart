import 'package:flutter/material.dart';
import 'package:httprequest/provider/crew_provider.dart';
import 'package:provider/provider.dart';
import 'package:httprequest/screen/addcrew.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => CrewProvider(),
        child: const AddCrew(),
      ),
    );
  }
}
