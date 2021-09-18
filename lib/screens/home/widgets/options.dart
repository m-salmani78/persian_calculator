import 'package:flutter/material.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.dark_mode_rounded)),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.backspace))
      ],
    );
  }
}
