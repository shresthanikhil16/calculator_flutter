import 'package:calculator_app/view/calculator_app_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const CalculatorView(),
        '/output': (context) => const CalculatorView(),
      },
    ),
  );
}