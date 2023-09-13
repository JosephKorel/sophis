import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BouncingBalls extends StatelessWidget {
  const BouncingBalls({super.key});

  @override
  Widget build(BuildContext context) {
    final ballWidgets = List<Widget>.generate(
      3,
      (index) {
        return Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const SizedBox(
                width: 30,
                height: 30,
              ),
            )
                .animate(
                  onComplete: (controller) => controller.repeat(reverse: true),
                  delay: (index + .5).seconds,
                )
                .slideY(
                  end: -.5,
                  duration: .8.seconds,
                  curve: Curves.easeOut,
                  delay: .5.seconds,
                ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.elliptical(30, 10)),
              ),
              child: const SizedBox(
                width: 30,
                height: 10,
              ),
            )
                .animate(
                  onComplete: (controller) => controller.repeat(reverse: true),
                  delay: (index + .5).seconds,
                )
                .scale(
                  begin: const Offset(.5, .5),
                  duration: .8.seconds,
                  delay: .5.seconds,
                ),
          ],
        );
      },
    );
    return Row(
      children: ballWidgets,
    );
  }
}

class AdviceLoadingView extends StatelessWidget {
  const AdviceLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('SOME RANDOM TEXT'),
            BouncingBalls(),
          ],
        ),
      ),
    );
  }
}
