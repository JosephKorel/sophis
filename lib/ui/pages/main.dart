import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/cubit/philosophers_cubit.dart';
import 'package:sophis/domain/philosopher_enum.dart';
import 'package:sophis/ui/widgets/card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _controller;
  late int pageIndex;

  void _onPageChange(int index) {
    context.read<PhilosophersCubit>().onPageChange(index);

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

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    pageIndex = _controller.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    final philosophers = Philosophers.values.map((e) => e.info()).toList();

    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: philosophers.length,
        onPageChanged: _onPageChange,
        itemBuilder: (context, index) {
          final philosopher = philosophers[index];
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
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (pageIndex != 0)
                          IconButton.filled(
                            onPressed: _previousPage,
                            icon: const Icon(Icons.chevron_left),
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF1E2B3B).withOpacity(0.6),
                            ),
                          ).animate().slideX(begin: -2, end: 0)
                        else
                          const SizedBox.shrink(),
                        if (pageIndex != philosophers.length - 1)
                          IconButton.filled(
                            onPressed: _nextPage,
                            icon: const Icon(Icons.chevron_right),
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF1E2B3B).withOpacity(0.6),
                            ),
                          ).animate().slideX(begin: 2, end: 0)
                        else
                          const SizedBox(),
                      ],
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
