import 'package:calculator/constants.dart';
import 'package:calculator/repo/calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Monitor extends StatelessWidget {
  final TextEditingController controller;

  const Monitor({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = context.watch<Calculator>().finalResult;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        borderRadius: defaultBorder,
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          TextField(
            controller: controller,
            readOnly: true,
            // showCursor: true,
            minLines: 1,
            maxLines: 4,
            style: const TextStyle(fontSize: 24),
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
          const Spacer(),
          Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
            color: Theme.of(context).primaryColor.withOpacity(0.4),
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              result.isEmpty ? '0' : result,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
