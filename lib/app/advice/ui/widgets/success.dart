import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/advice/bloc/advice_bloc.dart';

class ReceivedAdviceView extends StatelessWidget {
  const ReceivedAdviceView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AdviceBloc>();
    final advice = bloc.state.advice!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(advice),
        ],
      ),
    );
  }
}
