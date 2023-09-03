import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/cubit/philosophers_cubit.dart';

class PhilosopherDetailsView extends StatelessWidget {
  const PhilosopherDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final philos = context.watch<PhilosophersCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(philos.name),
      ),
    );
  }
}
