import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';
import 'package:sophis/app/home/ui/widgets/card.dart';

final _philosophers = Philosophers.values.map((e) => e.info()).toList();

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ColorScheme colorScheme = cardTheme.colorScheme;
  late PageController _controller;
  late int pageIndex;

  Future<void> _onPageChange(int index) async {
    context.read<PhilosophersCubit>().onPageChange(index);

    final image = _philosophers[index].image;
    final newScheme = await ColorScheme.fromImageProvider(
      provider: AssetImage(image),
    );

    setState(() {
      pageIndex = index;
      colorScheme = newScheme;
    });
  }

  void _nextPage() {
    final page = pageIndex + 1;
    _controller.animateToPage(
      page,
      duration: .800.seconds,
      curve: Curves.easeOutCubic,
    );
  }

  void _previousPage() {
    final page = pageIndex - 1;
    _controller.animateToPage(
      page,
      duration: .800.seconds,
      curve: Curves.easeOutCubic,
    );
  }

  void savedAdvices() {
    context.go('/savedAdvices');
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    pageIndex = _controller.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView.builder(
        controller: _controller,
        itemCount: _philosophers.length,
        onPageChanged: _onPageChange,
        itemBuilder: (context, index) {
          final philosopher = _philosophers[index];
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(philosopher.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextButton(
                      onPressed: savedAdvices,
                      child: const Text('Saved Advices'),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Theme(
                      data: cardTheme.copyWith(
                        colorScheme: colorScheme,
                      ),
                      child: Builder(
                        builder: (ctx) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (pageIndex != 0)
                              IconButton.filled(
                                onPressed: _previousPage,
                                icon: const Icon(Icons.chevron_left),
                                style: IconButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(ctx).colorScheme.onPrimary,
                                  backgroundColor: Theme.of(ctx)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.4),
                                ),
                              ).animate().slideX(
                                    begin: -2,
                                    end: 0,
                                    curve: Curves.easeOut,
                                    duration: .4.seconds,
                                  )
                            else
                              const SizedBox.shrink(),
                            if (pageIndex != _philosophers.length - 1)
                              IconButton.filled(
                                onPressed: _nextPage,
                                icon: const Icon(Icons.chevron_right),
                                style: IconButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(ctx).colorScheme.onPrimary,
                                  backgroundColor: Theme.of(ctx)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.4),
                                ),
                              ).animate().slideX(
                                    begin: 2,
                                    end: 0,
                                    curve: Curves.easeOut,
                                    duration: .4.seconds,
                                  )
                            else
                              const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PhilosopherCardWidget(philosopher: philosopher),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
