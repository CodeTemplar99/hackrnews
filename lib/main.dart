import 'package:flutter/material.dart';
// import 'package:hackrnews/controller/top_news_controller.dart';
import 'package:hackrnews/services/api_service.dart';
import 'package:provider/provider.dart';
import 'package:hackrnews/utils/misc.dart';
import 'package:hackrnews/views/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => APIService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackrnews',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(
          const Color(0xFF0658E6),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
