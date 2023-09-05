import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/advice/bloc/advice_bloc.dart';
import 'package:sophis/app/advice/ui/widgets/success.dart';
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
            AdviceInitial() => const Center(),
            LoadingAdvice() => const Center(
                child: CircularProgressIndicator(),
              ),
            ReceivedAdvice(advice: _) => const ReceivedAdviceView(),
            AdviceFailure() => const Center(
                child: Text('Oops, error'),
              ),
          };
        },
      ),
    );
  }
}
