import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
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
    final philosopher = context.watch<PhilosophersCubit>().state;

    final advice = bloc.state.advice;

    final boxBgColor = context.isDark
        ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
        : Theme.of(context).colorScheme.background;

    final boxShadowColor = context.isDark
        ? Colors.black.withOpacity(0.4)
        : Theme.of(context).colorScheme.onSurface.withOpacity(0.2);

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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: boxBgColor,
        ),
        clipBehavior: Clip.hardEdge,
        child: Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    philosopher.name,
                    style: GoogleFonts.kadwa(
                      textStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            height: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: philosopher.name.length > 12 ? 26 : 26,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SelectableText(
                    advice,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          letterSpacing: 1.2,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ).animate().shimmer(
              color: context.isDark
                  ? Theme.of(context).colorScheme.background.withOpacity(0.2)
                  : null,
              duration: .4.seconds,
            ),
      ),
    );
  }
}
