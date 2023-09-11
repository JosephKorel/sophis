import 'package:flutter/material.dart';
import 'package:sophis/app/saved_advices/ui/pages/widgets/list.dart';

class SavedAdvicesView extends StatelessWidget {
  const SavedAdvicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
      ),
      body: const AdvicesListContainer(),
    );
  }
}
