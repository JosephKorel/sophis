import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
import 'package:sophis/app/saved_advices/domain/saved_advice_entity.dart';
import 'package:sophis/app/saved_advices/presenter/cubit/saved_advice_cubit.dart';
import 'package:sophis/app/saved_advices/ui/pages/widgets/menu.dart';

class AdvicesListContainer extends StatelessWidget {
  const AdvicesListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final savedAdvices = context.watch<SavedAdviceCubit>().state.savedAdvices;

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

  void _seeAdvice(BuildContext context) {
    context
        .read<PhilosophersCubit>()
        .updateState(philosopher: advice.philosopher);

    context.push('/advice');
  }

  @override
  Widget build(BuildContext context) {
    final philosopher = advice.philosopher.info();

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: InkWell(
        onTap: () => _seeAdvice(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      advice.userInput,
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${philosopher.name} - ${philosopher.school}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.7),
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ),
              ),
              SavedAdviceMenu(
                adviceText: advice.advice,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _seeAdvice(BuildContext context) {}
