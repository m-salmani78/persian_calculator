import 'package:calculator/models/operator.dart';
import 'package:calculator/repo/calculator.dart';
import 'package:calculator/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomKeyboard extends StatelessWidget {
  final _mainAxisAlignment = MainAxisAlignment.spaceBetween;

  const CustomKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculator = context.watch<Calculator>();
    return Column(
      children: [
        _buildFirstRow(calculator),
        const SizedBox(height: 8),
        _buildNum7to9(calculator),
        const SizedBox(height: 8),
        _buildNum4to6(calculator),
        const SizedBox(height: 8),
        _buildNum1to3(calculator),
        const SizedBox(height: 8),
        _buildOtherNums(calculator),
      ],
    );
  }

  Widget _buildFirstRow(Calculator calculator) {
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
        CustomButton(
          onPressed: () {
            //todo
          },
          child: const Icon(Icons.backspace_outlined),
          primary: Colors.black,
        ),
        CustomButton(
            onPressed: () {
              calculator.addPercent();
            },
            child: const Text('%')),
        CustomButton(
            onPressed: () {
              calculator.addOperator(Operator.division);
            },
            child: const Text('÷')),
      ],
    );
  }

  _buildNum7to9(Calculator calculator) {
    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      children: [
        ...List.generate(
          3,
          (index) => CustomButton(
              onPressed: () {
                calculator.addNum('${index + 7}');
              },
              child: Text('${index + 7}')),
        ),
        CustomButton(
            onPressed: () {
              calculator.addOperator(Operator.multiplication);
            },
            child: const Text('×')),
      ],
    );
  }

  _buildNum4to6(Calculator calculator) {
    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      children: [
        ...List.generate(
          3,
          (index) => CustomButton(
              onPressed: () {
                calculator.addNum('${index + 4}');
              },
              child: Text('${index + 4}')),
        ),
        CustomButton(
            onPressed: () {
              calculator.addOperator(Operator.subtraction);
            },
            child: const Text('-')),
      ],
    );
  }

  _buildNum1to3(Calculator calculator) {
    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      children: [
        ...List.generate(
          3,
          (index) => CustomButton(
              onPressed: () {
                calculator.addNum('${index + 1}');
              },
              child: Text('${index + 1}')),
        ),
        CustomButton(
            onPressed: () {
              calculator.addOperator(Operator.addition);
            },
            child: const Text('+')),
      ],
    );
  }

  _buildOtherNums(Calculator calculator) {
    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      children: [
        CustomButton(
            onPressed: () {
              calculator.negativeNum();
            },
            child: const Text('+/-')),
        CustomButton(
            onPressed: () {
              calculator.addNum('0');
            },
            child: const Text('0')),
        CustomButton(
            onPressed: () {
              calculator.addDot();
            },
            child: const Text('.')),
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
