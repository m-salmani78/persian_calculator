enum Operator { addition, subtraction, multiplication, division }

String opertorToString(Operator operator) {
  switch (operator) {
    case Operator.addition:
      return '+';
    case Operator.subtraction:
      return '-';
    case Operator.multiplication:
      return '×';
    case Operator.division:
      return '÷';
  }
}
