import 'package:calculator/repo/calculator.dart';
import 'package:calculator/screens/home/widgets/keyboard.dart';
import 'package:calculator/screens/home/widgets/monitor.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final controller = TextEditingController(text: '0');

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculator = Calculator(controller: controller);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Flexible(child: Monitor(controller: controller)),
              const SizedBox(height: 16),
              CustomKeyboard(calculator: calculator),
            ],
          ),
        ),
      ),
    );
  }
}
