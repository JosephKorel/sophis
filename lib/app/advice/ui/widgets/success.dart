import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/advice/bloc/advice_bloc.dart';
import 'package:sophis/main.dart';

class ReceivedAdviceView extends StatefulWidget {
  const ReceivedAdviceView({super.key});

  @override
  State<ReceivedAdviceView> createState() => _ReceivedAdviceViewState();
}

class _ReceivedAdviceViewState extends State<ReceivedAdviceView> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AdviceBloc>();
    final userInput = bloc.state.userInput;
    final advice = bloc.state.advice;

    final boxShadowColor = context.isDark
        ? Colors.black.withOpacity(0.4)
        : Theme.of(context).colorScheme.onSurface.withOpacity(0.2);

    final textBoxBg = context.isDark
        ? Theme.of(context).colorScheme.background
        : Theme.of(context).colorScheme.background;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              userInput,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              textAlign: TextAlign.center,
            ).animate().shimmer(),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 10,
                      color: boxShadowColor,
                    ),
                  ],
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: textBoxBg,
                  ),
                  child: Scrollbar(
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SelectableText(
                          advice,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                letterSpacing: 1.2,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                          textAlign: TextAlign.justify,
                        ).animate().shimmer(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.copy,
                  ),
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 16,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                  ),
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 16,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_add,
                  ),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
