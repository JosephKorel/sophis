import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/app/advice/ui/widgets/buttons.dart';
import 'package:sophis/app/advice/ui/widgets/texts.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';

class ReceivedAdviceView extends StatelessWidget {
  const ReceivedAdviceView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AdviceBloc>();
    final philosopher = context.watch<PhilosophersCubit>().state;

    final userInput = bloc.state.userInput;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.contact_support,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Question',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animate().slideY(
                      begin: -2,
                      end: 0,
                      duration: .6.seconds,
                      curve: Curves.easeOutExpo,
                    ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  userInput,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                ).animate().slideY(
                      begin: -8,
                      end: 0,
                      duration: .6.seconds,
                      delay: .1.seconds,
                      curve: Curves.easeOutExpo,
                    ),
              ],
            ),
            // const UserInputWidget(),
            const SizedBox(
              height: 16,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AdviceWidget(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const AdviceViewButtons(),
          ],
        ),
      ),
    );
  }
}
