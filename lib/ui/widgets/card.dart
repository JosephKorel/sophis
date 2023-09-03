import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/cubit/philosophers_cubit.dart';
import 'package:sophis/domain/philosopher_entity.dart';

class PhilosopherCardWidget extends StatelessWidget {
  const PhilosopherCardWidget({required this.philosopher, super.key});

  final PhilosopherEntity philosopher;

  @override
  Widget build(BuildContext context) {
    final philosopherCard = context.watch<PhilosophersCubit>().state;

    return Column(
      children: [
        const Spacer(),
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4,
              sigmaY: 4,
            ),
            child: DecoratedBox(
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
                  children: [
                    Text(
                      philosopher.name,
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                                height: 0.8,
                              ),
                    ),
                    Text(
                      philosopher.school,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7),
                          ),
                    ),
                    Text(
                      philosopher.quote,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7),
                            fontStyle: FontStyle.italic,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
