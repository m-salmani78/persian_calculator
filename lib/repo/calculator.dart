import 'package:flutter/material.dart';

class Calculator extends ChangeNotifier {
  final TextEditingController controller;
  String finalResult = '';
  List<String> numbers = [];
  List<String> operators = [];

  Calculator({required this.controller});

  static String oprt(String str1, String str2, String operator) {
    var num1 = _cast(str1);
    var num2 = _cast(str2);
    switch (operator) {
      case '+':
        return '${num1 + num2}';
      case '-':
        return '${num1 - num2}';
      case '×':
        return '${num1 * num2}';
      case '÷':
        return '${num1 / num2}';
      default:
        return '0';
    }
  }

  void addNum(String value) {
    assert(value.length == 1);
    assert(value.compareTo('0') >= 0 && value.compareTo('9') <= 0);
    if (finalResult.isEmpty) {
      finalResult = value;
    } else if (operators.isEmpty) {
      finalResult += value;
    } else if (numbers.isNotEmpty && numbers.length >= operators.length) {
      numbers[numbers.length - 1] += value;
    } else {
      numbers.add(value);
    }
    controller.text = toString();
  }

  void addDot() {
    if (finalResult.isEmpty) {
      finalResult = '0.';
    } else if (operators.isEmpty) {
      if (finalResult.contains('.')) return;
      finalResult += '.';
    } else if (numbers.isNotEmpty && numbers.length >= operators.length) {
      if (numbers[numbers.length - 1].contains('.')) return;
      numbers[numbers.length - 1] += '.';
    } else {
      numbers.add('0.');
    }
    controller.text = toString();
  }

  void addOperator(String value) {
    if (finalResult.isEmpty) return;
    if (operators.length > numbers.length) {
      operators[operators.length - 1] = value;
    } else {
      operators.add(value);
    }
    controller.text = toString();
  }

  void calculateResult() {
    if (numbers.isEmpty) return;
    if (numbers.length != operators.length) throw Exception('invalid input');
    int index = _findOperator('*', '/');
    while (index >= 0) {
      _merge(index);
      index = _findOperator('*', '/');
    }
    index = _findOperator('+', '-');
    while (index >= 0) {
      _merge(index);
      index = _findOperator('+', '-');
    }
    var result = finalResult;
    for (int i = 0; i < numbers.length; i++) {
      result = oprt(result, numbers[i], operators[i]);
    }
    finalResult = result;
    numbers.clear();
    operators.clear();
    notifyListeners();
  }

  int _findOperator(String opr1, String opr2) {
    for (var i = 0; i < operators.length; i++) {
      if (opr1 == operators[i] || opr2 == operators[i]) {
        return i;
      }
    }
    return -1;
  }

  void _merge(int index) {
    String num1 = index > 0 ? numbers[index - 1] : finalResult;
    String result = oprt(num1, numbers[index], operators[index]);
    operators.removeAt(index);
    numbers.removeAt(index);
    if (index > 0) {
      numbers[index - 1] = result.toString();
    } else {
      finalResult = result;
    }
  }

  static _cast(String number) {
    try {
      return int.parse(number);
    } catch (e) {
      return double.parse(number);
    }
  }

  void clear() {
    finalResult = '';
    numbers.clear();
    operators.clear();
    controller.clear();
    notifyListeners();
  }

  @override
  String toString() {
    String str = finalResult;
    for (var i = 0; i < operators.length; i++) {
      str += operators[i];
      if (i < numbers.length) str += numbers[i];
    }
    return str;
  }
}
