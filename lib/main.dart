import 'package:flutter/material.dart';
import 'package:hackrnews/utils/misc.dart';
import 'package:hackrnews/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: createMaterialColor(
          const Color(0xFF2706E6),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
