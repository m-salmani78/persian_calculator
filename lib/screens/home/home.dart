import 'package:calculator/repo/calculator.dart';
import 'package:calculator/screens/home/widgets/keyboard.dart';
import 'package:calculator/screens/home/widgets/monitor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final controller = TextEditingController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListenableProvider<Calculator>(
          create: (context) => Calculator(controller: controller),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Flexible(child: Monitor(controller: controller)),
                const SizedBox(height: 16),
                const CustomKeyboard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
