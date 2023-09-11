import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/saved_advices/domain/saved_advice_entity.dart';
import 'package:sophis/app/saved_advices/presenter/cubit/saved_advice_cubit.dart';

class AdvicesListContainer extends StatelessWidget {
  const AdvicesListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final savedAdvices = context.watch<SavedAdviceCubit>().state.savedAdvices;

    print(savedAdvices.length);

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemCount: savedAdvices.length,
      itemBuilder: (context, index) {
        final advice = savedAdvices[index];
        return AdviceTile(advice: advice);
      },
    );
  }
}

class AdviceTile extends StatelessWidget {
  const AdviceTile({required this.advice, super.key});

  final SavedAdvice advice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                advice.userInput,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              Text('${advice.philosopherName} - ${advice.philosopherSchool}'),
            ],
          ),
        ),
      ],
    );
  }
}
