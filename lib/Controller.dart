import 'dart:math';

import 'package:bmi_calculator/Pages/InputPage.dart';

class CalculaterController {
  double _bmi = 0;
  final double height;
  final int weight;
  final int age;
  final Gender gender;

  CalculaterController(
      {required this.height,
      required this.weight,
      required this.age,
      required this.gender});

  String getBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.5) {
      return 'UNDERWEIGHT';
    } else if (_bmi < 25) {
      return 'NORMAL';
    } else if (_bmi < 30) {
      return 'OVERWEIGHT';
    } else {
      return 'OBESE';
    }
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return 'You are very severely underweight. Try to eat more.';
    } else if (_bmi < 25) {
      return 'You have a normal weight. Good job!';
    } else if (_bmi < 30) {
      return 'You are slightly overweight. Try to eat less.';
    } else {
      return 'You are severely overweight. Try to lose some weight.';
    }
  }
}
