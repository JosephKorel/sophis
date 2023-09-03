import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/app/home/domain/philosopher_entity.dart';
import 'package:sophis/app/home/ui/widgets/advice_dialog.dart';

class PhilosopherCardWidget extends StatelessWidget {
  const PhilosopherCardWidget({required this.philosopher, super.key});

  final PhilosopherEntity philosopher;

  @override
  Widget build(BuildContext context) {
    void seeDetails() {
      context.go('/details');
    }

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4,
          sigmaY: 4,
        ),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: const Color(0xFF1E2B3B).withOpacity(0.6),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            philosopher.name.toUpperCase(),
                            style: GoogleFonts.kadwa(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    height: 1,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        philosopher.name.length > 12 ? 26 : 26,
                                  ),
                            ),
                          ),
                          Text(
                            philosopher.school,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary
                                          .withOpacity(0.7),
                                    ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    IconButton.filled(
                      onPressed: seeDetails,
                      icon: const Icon(Icons.arrow_outward),
                      style: IconButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
                Text(
                  philosopher.quote,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.9),
                        fontStyle: FontStyle.italic,
                      ),
                  textAlign: TextAlign.center,
                ),
                FilledButton.icon(
                  onPressed: () => _openAdviceDialog(context),
                  icon: const Icon(Icons.bubble_chart),
                  label: const Text('ASK FOR ADVICE'),
                  style: FilledButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _openAdviceDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (_) {
      return const AlertDialog(
        content: AdviceDialog(),
      );
    },
  );
}
