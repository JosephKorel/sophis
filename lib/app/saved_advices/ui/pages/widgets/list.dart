import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';
import 'package:sophis/app/saved_advices/domain/saved_advice_entity.dart';
import 'package:sophis/app/saved_advices/presenter/cubit/saved_advice_cubit.dart';
import 'package:sophis/app/saved_advices/ui/pages/widgets/menu.dart';

const savedAdv = SavedAdvice(
  philosopher: Philosophers.seneca,
  userInput: 'How should i face obstacles',
  advice: '''
Ah, the beauty of the Stoic philosophy lies precisely in its guidance on facing obstacles. Remember, my friend, that obstacles are not meant to hinder you but to offer you an opportunity for growth and progress. Here are a few Stoic principles to keep in mind when facing obstacles:

1. Acceptance: Embrace the reality of the obstacle and accept that it is part of the natural order of things. Understand that you cannot control external events, but you can control how you react to them.

2. Virtuous mindset: Cultivate a virtuous mindset by focusing on what is within your control: your thoughts, actions, and intentions. Strive to respond to obstacles with wisdom, courage, and patience, rather than succumbing to anger or despair.

3. Willpower: Strengthen your resolve and exercise your willpower. Remember that obstacles are not there to defeat you but to test your character. Use them as opportunities to demonstrate your strength and resilience.

4. Inner reflection: Pause and reflect on the obstacle before hastily reacting. Ask yourself, "What can I learn from this situation? How can I use this obstacle to improve myself?" Adopting a reflective mindset will help you see the obstacle as a means of personal growth.

5. Focus on the present: Instead of dwelling on past failures or worrying about future uncertainties, train your mind to stay in the present moment. By focusing on what needs to be done in the here and now, you can tackle the obstacle with clarity and efficiency.

Remember, my friend, that obstacles are inevitable in life. They are not to be feared but embraced. Approach them with a calm and steadfast attitude, guided by virtue and reason, and you will emerge stronger and wiser on the other side.''',
);

class AdvicesListContainer extends StatelessWidget {
  const AdvicesListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final savedAdvices = context.watch<SavedAdviceCubit>().state.savedAdvices;
    // final savedAdvices = [savedAdv];

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
