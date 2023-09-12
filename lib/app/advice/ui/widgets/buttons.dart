// ignore_for_file: use_build_context_synchronously

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
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

    Future<void> saveAdvice() async {
      try {
        if (isSaved) {
          await context
              .read<SavedAdviceCubit>()
              .removeAdvice(adviceText: advice);

          _removedNotification(context);
          return;
        }

        final adviceToSave = SavedAdvice(
          philosopher: philosopher.getPhilosopher(),
          userInput: bloc.state.userInput,
          advice: advice,
        );

        await context
            .read<SavedAdviceCubit>()
            .saveAdvice(adviceToSave: adviceToSave);

        _savedNotification(context);
      } catch (e) {
        _errorNotification(context);
      }
    }

    void shareAdvice() {
      Share.share(advice, subject: 'Check out this advice');
    }

    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => _copyText(advice, context),
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
            onPressed: shareAdvice,
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

Future<void> _copyText(String text, BuildContext context) async {
  await Clipboard.setData(ClipboardData(text: text));

  _copiedTextNotification(context);
}

void _errorNotification(BuildContext context) {
  Flushbar<void>(
    message: 'Something went wrong. Try again.',
    backgroundColor: Theme.of(context).colorScheme.error,
    icon: Icon(
      Icons.error,
      color: Theme.of(context).colorScheme.onError,
    ),
    duration: 2.seconds,
    animationDuration: .4.seconds,
    margin: const EdgeInsets.all(16),
    borderRadius: BorderRadius.circular(16),
  ).show(context);
}

void _copiedTextNotification(BuildContext context) {
  Flushbar<void>(
    message: 'Copied',
    backgroundColor: Theme.of(context).colorScheme.primary,
    icon: Icon(
      Icons.copy,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
    duration: 2.seconds,
    animationDuration: .4.seconds,
    margin: const EdgeInsets.all(16),
    borderRadius: BorderRadius.circular(16),
  ).show(context);
}

void _savedNotification(BuildContext context) {
  Flushbar<void>(
    message: 'Saved in favorites',
    backgroundColor: Theme.of(context).colorScheme.primary,
    icon: Icon(
      Icons.check_circle,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
    duration: 2.seconds,
    animationDuration: .4.seconds,
    margin: const EdgeInsets.all(16),
    borderRadius: BorderRadius.circular(16),
  ).show(context);
}

void _removedNotification(BuildContext context) {
  Flushbar<void>(
    message: 'Removed from favorites',
    backgroundColor: Theme.of(context).colorScheme.primary,
    icon: Icon(
      Icons.check_circle,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
    duration: 2.seconds,
    animationDuration: .4.seconds,
    margin: const EdgeInsets.all(16),
    borderRadius: BorderRadius.circular(16),
  ).show(context);
}
