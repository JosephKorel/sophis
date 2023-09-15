import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/app/advice/ui/widgets/buttons.dart';
import 'package:sophis/app/advice/ui/widgets/texts.dart';
import 'package:sophis/app/home/ui/pages/main.dart';
import 'package:sophis/main.dart';

class ReceivedAdviceView extends StatelessWidget {
  const ReceivedAdviceView({super.key});

  @override
  Widget build(BuildContext context) {
    final philosopher = context.watch<AdviceBloc>().state.philosopher;

    final philosopherColorScheme = themeColors[philosopher.index];

    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: context.isDark
            ? philosopherColorScheme.dark
            : philosopherColorScheme.light,
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
            ),
            body: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AdviceQuestion(),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: AdviceWidget(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                AdviceViewButtons(),
              ],
            ),
          );
        },
      ),
    );
  }
}
