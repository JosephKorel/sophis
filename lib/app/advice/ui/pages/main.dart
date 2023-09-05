import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/advice/bloc/advice_bloc.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';

class AdviceView extends StatelessWidget {
  const AdviceView({super.key});

  @override
  Widget build(BuildContext context) {
    final philosopher = context.watch<PhilosophersCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(philosopher.state.name),
      ),
      body: BlocBuilder<AdviceBloc, AdviceState>(
        builder: (context, state) {
          return switch (state) {
            AdviceInitial() => const Text('Initial State'),
            LoadingAdvice() => const Center(
                child: CircularProgressIndicator(),
              ),
            ReceivedAdvice(advice: final advice) => const Center(
                child: Text('We have data'),
              ),
            AdviceFailure() => const Center(
                child: Text('Oops, error'),
              ),
          };
        },
      ),
    );
  }
}
