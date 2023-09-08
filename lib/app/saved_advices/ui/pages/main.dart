import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/saved_advices/presenter/cubit/saved_advice_cubit.dart';

class SavedAdvicesView extends StatelessWidget {
  const SavedAdvicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final savedAdvices = context.watch<SavedAdviceCubit>().state.savedAdvices;

    return Scaffold(
      appBar: AppBar(),
    );
  }
}
