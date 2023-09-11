import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophis/app/core/cubit/scheme.dart';
import 'package:sophis/app/core/cubit/theme_cubit.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';
import 'package:sophis/app/home/ui/widgets/card.dart';

final themeColors = <AppColorScheme>[];

final _philosophers = Philosophers.values.map((e) => e.info()).toList();

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _controller;
  late int pageIndex;

  Future<void> _fetchColors() async {
    await _getColorSchemes();
    _changeTheme(0);
  }

  void _changeTheme(int index) =>
      context.read<ThemeCubit>().changeTheme(pageIndex: index);

  Future<void> _onPageChange(int index) async {
    context.read<PhilosophersCubit>().onPageChange(index);

    _changeTheme(index);

    setState(() {
      pageIndex = index;
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

  void _savedAdvices() {
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
    _fetchColors();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.watch<ThemeCubit>().state.colorScheme.light;

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return switch (state) {
          ThemeInitial() => const Scaffold(),
          ThemeChange(colorScheme: _) => Scaffold(
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
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 64,
                        right: 16,
                        bottom: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: _savedAdvices,
                              icon: const Icon(Icons.bookmark_outlined),
                              style: IconButton.styleFrom(
                                foregroundColor: colorScheme.onPrimary,
                                backgroundColor:
                                    colorScheme.primary.withOpacity(0.4),
                              ),
                            ).animate().slideY(
                                  begin: -4,
                                  end: 0,
                                  curve: Curves.easeOut,
                                  duration: .4.seconds,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (pageIndex != 0)
                                      IconButton.filled(
                                        onPressed: _previousPage,
                                        icon: const Icon(Icons.chevron_left),
                                        style: IconButton.styleFrom(
                                          foregroundColor: Theme.of(ctx)
                                              .colorScheme
                                              .onPrimary,
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
                                          foregroundColor: Theme.of(ctx)
                                              .colorScheme
                                              .onPrimary,
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
            )
        };
      },
    );
  }
}

Future<void> _getColorSchemes() async {
  final philosophers = Philosophers.values.map((e) => e.info()).toList();

  themeColors.clear();

  for (final philosopher in philosophers) {
    final lightScheme = await ColorScheme.fromImageProvider(
      provider: AssetImage(philosopher.image),
    );

    final darkScheme = await ColorScheme.fromImageProvider(
      provider: AssetImage(philosopher.image),
      brightness: Brightness.dark,
    );

    themeColors.add(
      AppColorScheme(light: lightScheme, dark: darkScheme),
    );
  }
}
