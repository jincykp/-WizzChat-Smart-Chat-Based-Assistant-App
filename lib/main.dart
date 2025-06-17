import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wizzchat/firebase_options.dart';
import 'package:wizzchat/views/home_screen.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wizz Chat',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Color(0xFF075E54),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1976D2),
          foregroundColor: Colors.white,
        ),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
