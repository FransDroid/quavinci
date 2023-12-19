import 'package:flutter/material.dart';
import 'package:quavinci/src/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF2700)),
        useMaterial3: true,
        primaryColor:const Color(0xFFFF2700)
      ),
      home: const HomeScreen(),
    );
  }
}
