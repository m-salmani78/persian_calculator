import 'package:calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Monitor extends StatelessWidget {
  final TextEditingController controller;

  const Monitor({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        borderRadius: defaultBorder,
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: controller,
            readOnly: true,
            showCursor: true,
            minLines: 1,
            maxLines: 10,
            style: const TextStyle(fontSize: 24),
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: EdgeInsets.all(16),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(bottom: 16, right: 24),
            child: Text(
              '0',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
