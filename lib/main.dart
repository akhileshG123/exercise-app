import 'package:flutter/material.dart';
import 'package:exercise_app/splash_page.dart'; // Adjust the import based on your file structure

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          headlineMedium: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold), // Equivalent to headline6
          bodyMedium: TextStyle(
              fontSize: 16, color: Colors.grey[700]), // Equivalent to bodyText2
        ),

        // primarySwatch: Colors.teal,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashPage(),
    );
  }
}
