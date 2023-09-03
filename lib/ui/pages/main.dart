import 'package:flutter/material.dart';
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
              child: PhilosopherCardWidget(philosopher: philosopher),
            ),
          );
        },
      ),
    );
  }
}
