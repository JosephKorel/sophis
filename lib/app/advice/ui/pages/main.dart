import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/advice/bloc/advice_bloc.dart';
import 'package:sophis/app/advice/ui/widgets/loading.dart';
import 'package:sophis/app/advice/ui/widgets/success.dart';

class AdviceView extends StatelessWidget {
  const AdviceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdviceBloc, AdviceState>(
      builder: (context, state) {
        return switch (state) {
          AdviceInitial() => const AdviceLoadingView(),
          ReceivedAdvice(advice: _) => const ReceivedAdviceView(),
          AdviceFailure() => const Center(
              child: Text('Oops, error'),
            ),
        };
      },
    );
  }
}
