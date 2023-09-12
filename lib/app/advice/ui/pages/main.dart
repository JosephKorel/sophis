import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/app/advice/ui/widgets/loading.dart';
import 'package:sophis/app/advice/ui/widgets/success.dart';
import 'package:sophis/injection_container.dart';

class AdviceViewContainer extends StatefulWidget {
  const AdviceViewContainer({
    required this.adviceEvent,
    super.key,
  });

  final AdviceEvent adviceEvent;

  @override
  State<AdviceViewContainer> createState() => _AdviceViewContainerState();
}

class _AdviceViewContainerState extends State<AdviceViewContainer> {
  @override
  void initState() {
    super.initState();

    context.read<AdviceBloc>().add(widget.adviceEvent);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<AdviceBloc>(),
      child: BlocBuilder<AdviceBloc, AdviceState>(
        builder: (context, state) {
          return switch (state) {
            AdviceInitial() => const AdviceLoadingView(),
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

class AdviceView extends StatefulWidget {
  const AdviceView({
    required this.adviceEvent,
    super.key,
  });

  final AdviceEvent adviceEvent;

  @override
  State<AdviceView> createState() => _AdviceViewState();
}

class _AdviceViewState extends State<AdviceView> {
  @override
  void initState() {
    super.initState();
    context.read<AdviceBloc>().add(widget.adviceEvent);
  }

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
