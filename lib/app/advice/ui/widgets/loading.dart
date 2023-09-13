import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';

class BouncingBalls extends StatelessWidget {
  const BouncingBalls({super.key});

  @override
  Widget build(BuildContext context) {
    final ballWidgets = List<Widget>.generate(
      3,
      (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
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
                    onComplete: (controller) =>
                        controller.repeat(reverse: true),
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
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(30, 10)),
                ),
                child: const SizedBox(
                  width: 30,
                  height: 10,
                ),
              )
                  .animate(
                    onComplete: (controller) =>
                        controller.repeat(reverse: true),
                    delay: (index + .5).seconds,
                  )
                  .scale(
                    begin: const Offset(.5, .5),
                    duration: .8.seconds,
                    delay: .5.seconds,
                  ),
            ],
          ).animate(delay: (index / 4).seconds).scale(),
        );
      },
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ballWidgets,
    );
  }
}

class AdviceLoadingView extends StatelessWidget {
  const AdviceLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final philosopher = context.watch<AdviceBloc>().state.philosopher;

    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '"',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),
                  TextSpan(text: philosopher.loadingPhrase()),
                  TextSpan(
                    text: '"',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),
                ],
                style: GoogleFonts.badScript(
                  textStyle:
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                ),
              ),
              textAlign: TextAlign.center,
            )
                .animate(
                  onComplete: (controller) => controller.repeat(reverse: true),
                )
                .fade(duration: 1.5.seconds, end: .4),
            const SizedBox(
              height: 32,
            ),
            const BouncingBalls(),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
