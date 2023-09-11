import 'package:flutter/material.dart';
import 'package:sophis/app/advice/ui/widgets/buttons.dart';
import 'package:sophis/app/advice/ui/widgets/texts.dart';

class ReceivedAdviceView extends StatelessWidget {
  const ReceivedAdviceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AdviceQuestion(),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: AdviceWidget(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          AdviceViewButtons(),
        ],
      ),
    );
  }
}
