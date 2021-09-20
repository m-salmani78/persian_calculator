import 'dart:developer';

import 'package:calculator/models/operator.dart';
import 'package:flutter/material.dart';

class Calculator extends ChangeNotifier {
  final TextEditingController controller;
  String finalResult = '';
  List<String> numbers = [];
  List<Operator> operators = [];

  Calculator({required this.controller});

  static String oprt(String str1, String str2, Operator operator) {
    var num1 = _cast(str1);
    var num2 = _cast(str2);
    if (str1.contains('%')) {
      num1 /= 100;
    }
    if (str2.contains('%')) {
      num2 /= 100;
      if (operator == Operator.addition || operator == Operator.subtraction) {
        num2 *= num1;
      }
    }
    switch (operator) {
      case Operator.addition:
        return '${num1 + num2}';
      case Operator.subtraction:
        return '${num1 - num2}';
      case Operator.multiplication:
        return '${num1 * num2}';
      case Operator.division:
        return '${num1 / num2}';
      default:
        return '0';
    }
  }

  void addNum(String value) {
    assert(value.length == 1);
    assert(value.compareTo('0') >= 0 && value.compareTo('9') <= 0);
    if (numbers.length > operators.length) {
      final num = numbers[numbers.length - 1];
      if (num.contains('%')) {
        operators.add(Operator.multiplication);
        numbers.add(value);
      } else {
        numbers[numbers.length - 1] = num + value;
      }
    } else {
      numbers.add(value);
    }
    controller.text = toString();
  }

  void addDot() {
    if (numbers.length > operators.length) {
      if (numbers[numbers.length - 1].contains('.')) return;
      numbers[numbers.length - 1] += '.';
    } else {
      numbers.add('0.');
    }
    controller.text = toString();
  }

  void addPercent() {
    if (numbers.length != operators.length + 1) {
      log('@ addPercent Error');
      return;
    }
    numbers[numbers.length - 1] += '%';
    controller.text = toString();
  }

  void negativeNum() {
    final len = numbers.length;
    if (len > 0) {
      numbers[len - 1] = (-1 * _cast(numbers[len - 1])).toString();
    }
    controller.text = toString();
  }

  void addOperator(Operator value) {
    if (finalResult.isEmpty && numbers.isEmpty) return;
    if (operators.isNotEmpty && operators.length >= numbers.length) {
      operators[operators.length - 1] = value;
    } else {
      if (numbers.isEmpty) numbers.add(finalResult);
      operators.add(value);
    }
    controller.text = toString();
  }

  void calculateResult() {
    if (numbers.length != operators.length + 1) return;
    int index = _findOperator(Operator.multiplication, Operator.division);
    while (index >= 0) {
      _merge(index);
      index = _findOperator(Operator.multiplication, Operator.division);
    }
    index = _findOperator(Operator.addition, Operator.subtraction);
    while (index >= 0) {
      _merge(index);
      index = _findOperator(Operator.addition, Operator.subtraction);
    }
    finalResult = numbers[0];
    for (int i = 0; i < operators.length; i++) {
      finalResult = oprt(finalResult, numbers[i + 1], operators[i]);
    }
    numbers.clear();
    operators.clear();
    notifyListeners();
  }

  int _findOperator(Operator opr1, Operator opr2) {
    for (var i = 0; i < operators.length; i++) {
      if (opr1 == operators[i] || opr2 == operators[i]) {
        return i;
      }
    }
    return -1;
  }

  void _merge(int index) {
    if (index < 0 || index + 1 >= numbers.length) {
      log('@ _merge Error');
      return;
    }
    String result = oprt(numbers[index], numbers[index + 1], operators[index]);
    operators.removeAt(index);
    numbers.removeAt(index + 1);
    numbers[index] = result;
  }

  static _cast(String number) {
    if (number.contains('%')) {
      number = number.split('%')[0];
    }
    try {
      return int.parse(number);
    } catch (e) {
      return double.parse(number);
    }
  }

  void clear() {
    if (numbers.isEmpty) {
      finalResult = '';
    }
    numbers.clear();
    operators.clear();
    controller.clear();
    notifyListeners();
  }

  @override
  String toString() {
    if (numbers.isEmpty) return '';
    String str = numbers[0];
    for (var i = 0; i < operators.length; i++) {
      str += ' ${opertorToString(operators[i])} ';
      if (i + 1 < numbers.length) {
        final num = numbers[i + 1];
        if (num[0] == '-') {
          str += '($num)';
        } else {
          str += num;
        }
      }
    }
    return str;
  }
}
