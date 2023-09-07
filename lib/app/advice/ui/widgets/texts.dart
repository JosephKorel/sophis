import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/advice/bloc/advice_bloc.dart';

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
          ),
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
