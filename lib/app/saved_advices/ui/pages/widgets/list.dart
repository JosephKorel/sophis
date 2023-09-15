import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/app/saved_advices/domain/saved_advice_entity.dart';
import 'package:sophis/app/saved_advices/presenter/cubit/saved_advice_cubit.dart';
import 'package:sophis/app/saved_advices/ui/pages/widgets/menu.dart';

class AdvicesListContainer extends StatelessWidget {
  const AdvicesListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final advices = context.watch<SavedAdviceCubit>().state.savedAdvices;

    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemCount: advices.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      itemBuilder: (context, index) {
        final advice = advices[index];
        return AdviceTile(advice: advice);
      },
    );
  }
}

class AdviceTile extends StatelessWidget {
  const AdviceTile({required this.advice, super.key});

  final SavedAdvice advice;

  void _seeAdvice(BuildContext context) {
    final adviceState = ReceivedAdvice(
      advice: advice.advice,
      userInput: advice.userInput,
      philosopher: advice.philosopher,
    );

    context.push(
      '/advice',
      extra: UpdateAdviceEvent(advice: adviceState),
    );
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
                      overflow: TextOverflow.ellipsis,
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
              // MyMenuBar()
            ],
          ),
        ),
      ),
    );
  }
}

void _seeAdvice(BuildContext context) {}
