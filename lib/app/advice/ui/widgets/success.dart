import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/advice/bloc/advice_bloc.dart';

class ReceivedAdviceView extends StatelessWidget {
  const ReceivedAdviceView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AdviceBloc>();
    final userInput = bloc.state.userInput;
    final advice = bloc.state.advice;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            userInput,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.9),
                  fontStyle: FontStyle.italic,
                ),
            textAlign: TextAlign.center,
          ).animate().shimmer(),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 10,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.2),
                  ),
                ],
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      advice,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      textAlign: TextAlign.justify,
                    ).animate().shimmer(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                ),
                label: const Text('Share'),
              ),
              const SizedBox(
                width: 16,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_add,
                ),
                label: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
