import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          const Text('Seems like your connection is unstable'),
          FilledButton(
            onPressed: () {},
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
