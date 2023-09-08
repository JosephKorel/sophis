import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
import 'package:sophis/app/home/domain/philosopher_entity.dart';
import 'package:sophis/app/home/ui/widgets/advice_dialog.dart';
import 'package:sophis/config/theme/color_schemes.g.dart';

final cardTheme = ThemeData(
  colorScheme: lightColorScheme,
  useMaterial3: true,
  brightness: Brightness.light,
  textTheme: GoogleFonts.poppinsTextTheme(),
);

class PhilosopherCardWidget extends StatefulWidget {
  const PhilosopherCardWidget({required this.philosopher, super.key});

  final PhilosopherEntity philosopher;

  @override
  State<PhilosopherCardWidget> createState() => _PhilosopherCardWidgetState();
}

class _PhilosopherCardWidgetState extends State<PhilosopherCardWidget> {
  ColorScheme colorScheme = cardTheme.colorScheme;

  Future<void> _onPageChange() async {
    final newScheme =
        await context.read<PhilosophersCubit>().currentColorScheme();
    setState(() {
      colorScheme = newScheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    void seeDetails() {
      context.go('/advice');
    }

    return BlocListener<PhilosophersCubit, PhilosopherEntity>(
      listener: (context, state) {
        _onPageChange();
      },
      child: Theme(
        data: cardTheme.copyWith(
            colorScheme: colorScheme, brightness: Brightness.dark),
        child: Builder(
          builder: (ctx) => ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4,
                sigmaY: 4,
              ),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Theme.of(ctx).colorScheme.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  widget.philosopher.name.toUpperCase(),
                                  style: GoogleFonts.kadwa(
                                    textStyle: Theme.of(ctx)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          color: Theme.of(ctx)
                                              .colorScheme
                                              .onPrimary,
                                          height: 1,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              widget.philosopher.name.length >
                                                      12
                                                  ? 26
                                                  : 26,
                                        ),
                                  ),
                                )
                                    .animate(delay: .200.seconds)
                                    .fadeIn()
                                    .slideX(),
                                Text(
                                  widget.philosopher.school,
                                  style: Theme.of(ctx)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Theme.of(ctx)
                                            .colorScheme
                                            .onPrimary
                                            .withOpacity(0.7),
                                      ),
                                  textAlign: TextAlign.left,
                                )
                                    .animate(delay: .200.seconds)
                                    .fadeIn()
                                    .slideX(),
                              ],
                            ),
                          ),
                          IconButton.filled(
                            onPressed: seeDetails,
                            icon: const Icon(Icons.arrow_outward),
                            style: IconButton.styleFrom(
                              foregroundColor:
                                  Theme.of(ctx).colorScheme.onPrimary,
                              backgroundColor: Theme.of(ctx)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.4),
                            ),
                          )
                              .animate(delay: .200.seconds)
                              .fadeIn()
                              .slideX(begin: 2, end: 0),
                        ],
                      ),
                      Text(
                        widget.philosopher.quote,
                        style: Theme.of(ctx).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(ctx)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.9),
                              letterSpacing: 1.1,
                              fontStyle: FontStyle.italic,
                            ),
                        textAlign: TextAlign.center,
                      ).animate(delay: .300.seconds).fadeIn(),
                      FilledButton.icon(
                        onPressed: () => _openAdviceDialog(context),
                        icon: const Icon(Icons.bubble_chart),
                        label: const Text('ASK A QUESTION'),
                        style: FilledButton.styleFrom(
                          foregroundColor: Theme.of(ctx).colorScheme.onPrimary,
                          backgroundColor: Theme.of(ctx)
                              .colorScheme
                              .primary
                              .withOpacity(0.4),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                          .animate(delay: .200.seconds)
                          .fadeIn()
                          .slideY(begin: 2, end: 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _openAdviceDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (_) {
      return const AlertDialog(
        elevation: 0,
        insetPadding: EdgeInsets.all(8),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        content: AdviceDialog(),
      );
    },
  );
}

                  // color: const Color(0xFF1E2B3B).withOpacity(0.6),
