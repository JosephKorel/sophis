import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';

class AdviceViewButtons extends StatelessWidget {
  const AdviceViewButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AdviceBloc>();
    final advice = bloc.state.advice;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => _copyText(advice),
          icon: const Icon(
            Icons.copy,
          ),
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(
          width: 16,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
          ),
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(
          width: 16,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.bookmark_add,
          ),
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}

void _copyText(String text) {
  Clipboard.setData(ClipboardData(text: text));
}
