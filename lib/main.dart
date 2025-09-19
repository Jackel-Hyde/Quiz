import 'package:flutter/material.dart';
import 'package:quiz/interface/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:quiz/result_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ResultProvider(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
