import 'package:bmi_calculator/Pages/ResultPage.dart';
import 'package:flutter/material.dart';
import 'Pages/InputPage.dart';

void main() {
  runApp(const BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/input',
      routes: {
        '/input': (context) => InputPage(),
        '/result': (context) => ResultsPages(),
      },
      title: 'BMI Calculator',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        disabledColor: Color(0xFF8D8E98),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0D22),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFFE0167),
        ),
      ),
    );
  }
}
