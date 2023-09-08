import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
import 'package:sophis/app/saved_advices/domain/saved_advice_entity.dart';
import 'package:sophis/app/saved_advices/presenter/cubit/saved_advice_cubit.dart';

class AdviceViewButtons extends StatelessWidget {
  const AdviceViewButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AdviceBloc>();
    final savedAdvices = context.watch<SavedAdviceCubit>().state.savedAdvices;
    final philosopher = context.watch<PhilosophersCubit>().state;
    final advice = bloc.state.advice;

    final isSaved = savedAdvices.any((element) => element.advice == advice);

    void saveAdvice() {
      final adviceToSave = SavedAdvice(
        philosopherName: philosopher.name,
        philosopherSchool: philosopher.school,
        userInput: bloc.state.userInput,
        advice: advice,
      );

      context.read<SavedAdviceCubit>().saveAdvice(adviceToSave: adviceToSave);
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => _copyText(advice),
            icon: const Icon(
              Icons.copy,
            ),
            color: Theme.of(context).colorScheme.primary,
          ).animate().slideY(
                begin: 4,
                end: 0,
                curve: Curves.easeOutCubic,
                duration: .6.seconds,
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
          ).animate().slideY(
                begin: 4,
                end: 0,
                curve: Curves.easeOutCubic,
                duration: .8.seconds,
              ),
          const SizedBox(
            width: 16,
          ),
          IconButton(
            onPressed: saveAdvice,
            icon: Icon(
              isSaved ? Icons.bookmark_added : Icons.bookmark_add,
            ),
            color: Theme.of(context).colorScheme.primary,
          ).animate().slideY(
                begin: 4,
                end: 0,
                curve: Curves.easeOutCubic,
                duration: 1.seconds,
              ),
        ],
      ),
    );
  }
}

Future<void> _copyText(String text) async {
  await Clipboard.setData(ClipboardData(text: text));
}
