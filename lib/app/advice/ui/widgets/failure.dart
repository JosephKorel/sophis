import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/app/core/error.dart';

class AdviceFailureView extends StatelessWidget {
  const AdviceFailureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<AdviceBloc, AdviceState>(
        builder: (context, state) {
          return switch (state.exception) {
            ConnectionFailure() => const ConnectionFailureView(),
            ResponseFailure() => const Text('As'),
            null => const Placeholder()
          };
        },
      ),
    );
  }
}

class ConnectionFailureView extends StatelessWidget {
  const ConnectionFailureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Icon(
            Symbols.signal_disconnected_rounded,
            size: 64,
          )
              .animate(
                onComplete: (controller) => controller.repeat(),
              )
              .shake(delay: 1.seconds, duration: 1.5.seconds),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Seems like your connection is unstable',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ).animate().fadeIn(),
          const SizedBox(
            height: 16,
          ),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.replay_outlined),
            label: const Text('Try again'),
          ).animate().fadeIn().slideY(
                begin: 8,
                end: 0,
                curve: Curves.easeOutCirc,
              ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.home),
            label: const Text('Home'),
          ).animate().fadeIn(delay: .2.seconds).slideY(
                begin: 6,
                end: 0,
                curve: Curves.easeOutCirc,
              ),
        ],
      ),
    );
  }
}
