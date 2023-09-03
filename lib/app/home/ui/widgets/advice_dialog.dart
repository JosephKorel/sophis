import 'package:flutter/material.dart';

class AdviceDialog extends StatefulWidget {
  const AdviceDialog({super.key});

  @override
  State<AdviceDialog> createState() => _AdviceDialogState();
}

class _AdviceDialogState extends State<AdviceDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(),
        ElevatedButton(
          onPressed: () {},
          child: const Text('ASK'),
        ),
      ],
    );
  }
}
