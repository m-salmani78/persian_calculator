import 'package:calculator/repo/calculator.dart';
import 'package:calculator/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomKeyboard extends StatelessWidget {
  final Calculator calculator;
  final _mainAxisAlignment = MainAxisAlignment.spaceBetween;

  const CustomKeyboard({Key? key, required this.calculator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFirstRow(),
        const SizedBox(height: 8),
        _buildNum7to9(),
        const SizedBox(height: 8),
        _buildNum4to6(),
        const SizedBox(height: 8),
        _buildNum1to3(),
        const SizedBox(height: 8),
        _buildOtherNums(),
      ],
    );
  }

  Widget _buildFirstRow() {
    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      children: [
        CustomButton(
          onPressed: () {
            calculator.clear();
          },
          child: const Text('C'),
          primary: Colors.red,
        ),
        CustomButton(onPressed: () {}, child: const Text('()')),
        CustomButton(onPressed: () {}, child: const Text('%')),
        CustomButton(
            onPressed: () {
              calculator.addOperator('/');
            },
            child: const Text('/')),
      ],
    );
  }

  _buildNum7to9() {
    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      children: [
        CustomButton(
            onPressed: () {
              calculator.addNum('7');
            },
            child: const Text('7')),
        CustomButton(
            onPressed: () {
              calculator.addNum('8');
            },
            child: const Text('8')),
        CustomButton(
            onPressed: () {
              calculator.addNum('9');
            },
            child: const Text('9')),
        CustomButton(
            onPressed: () {
              calculator.addOperator('*');
            },
            child: const Text('*')),
      ],
    );
  }

  _buildNum4to6() {
    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      children: [
        CustomButton(
            onPressed: () {
              calculator.addNum('4');
            },
            child: const Text('4')),
        CustomButton(
            onPressed: () {
              calculator.addNum('5');
            },
            child: const Text('5')),
        CustomButton(
            onPressed: () {
              calculator.addNum('6');
            },
            child: const Text('6')),
        CustomButton(
            onPressed: () {
              calculator.addOperator('-');
            },
            child: const Text('-')),
      ],
    );
  }

  _buildNum1to3() {
    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      children: [
        CustomButton(
            onPressed: () {
              calculator.addNum('1');
            },
            child: const Text('1')),
        CustomButton(
            onPressed: () {
              calculator.addNum('2');
            },
            child: const Text('2')),
        CustomButton(
            onPressed: () {
              calculator.addNum('3');
            },
            child: const Text('3')),
        CustomButton(
            onPressed: () {
              calculator.addOperator('+');
            },
            child: const Text('+')),
      ],
    );
  }

  _buildOtherNums() {
    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      children: [
        CustomButton(onPressed: () {}, child: const Text('+/-')),
        CustomButton(
            onPressed: () {
              calculator.addNum('0');
            },
            child: const Text('0')),
        CustomButton(onPressed: () {}, child: const Text(',')),
        CustomButton(
          outlined: false,
          onPressed: () {
            calculator.calculateResult();
          },
          child: const Text('='),
        ),
      ],
    );
  }
}
