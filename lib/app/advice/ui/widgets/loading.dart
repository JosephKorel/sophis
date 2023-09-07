import 'package:flutter/material.dart';

class AdviceLoadingView extends StatelessWidget {
  const AdviceLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
