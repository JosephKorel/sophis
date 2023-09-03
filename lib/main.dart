import 'package:flutter/material.dart';
import 'package:sophis/ui/pages/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sophis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E2B3B)),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
