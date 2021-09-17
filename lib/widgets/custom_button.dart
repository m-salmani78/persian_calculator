import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.primary,
    this.outlined = true,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final Color? primary;
  final bool outlined;
  final _textStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.w600);
  final _shape = const RoundedRectangleBorder(borderRadius: defaultBorder);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 4 - 24;
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: width, minHeight: width),
      child: outlined
          ? OutlinedButton(
              onPressed: onPressed,
              child: child,
              style: OutlinedButton.styleFrom(
                primary: primary,
                textStyle: _textStyle,
                shape: _shape,
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              child: child,
              style: ElevatedButton.styleFrom(
                primary: primary,
                textStyle: _textStyle,
                shape: _shape,
              ),
            ),
    );
  }
}
