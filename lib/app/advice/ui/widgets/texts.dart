import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/main.dart';

class UserInputWidget extends StatefulWidget {
  const UserInputWidget({super.key});

  @override
  State<UserInputWidget> createState() => _UserInputWidgetState();
}

class _UserInputWidgetState extends State<UserInputWidget> {
  bool expand = false;

  void _onExpand() {
    setState(() {
      expand = !expand;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AdviceBloc>();
    final userInput = bloc.state.userInput;

    if (userInput.length > 90) {
      return Column(
        children: [
          Text(
            userInput,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            textAlign: TextAlign.center,
            maxLines: expand ? null : 2,
            overflow: TextOverflow.fade,
          ).animate().shimmer(),
          IconButton(
            onPressed: _onExpand,
            icon: Icon(
              expand
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
            ),
          ),
        ],
      );
    }

    return Text(
      userInput,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontStyle: FontStyle.italic,
            color: Theme.of(context).colorScheme.onSurface,
          ),
      textAlign: TextAlign.center,
    ).animate().shimmer();
  }
}

class AdviceWidget extends StatefulWidget {
  const AdviceWidget({super.key});

  @override
  State<AdviceWidget> createState() => _AdviceWidgetState();
}

class _AdviceWidgetState extends State<AdviceWidget> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AdviceBloc>();
    final advice = bloc.state.advice;

    final boxShadowColor = context.isDark
        ? Colors.black.withOpacity(0.4)
        : Theme.of(context).colorScheme.onSurface.withOpacity(0.2);

    final textBoxBg = context.isDark
        ? Theme.of(context).colorScheme.background
        : Theme.of(context).colorScheme.background;

    return DecoratedBox(
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
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      letterSpacing: 1.2,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                textAlign: TextAlign.justify,
              ).animate().shimmer(),
            ),
          ),
        ),
      ),
    );
  }
}
