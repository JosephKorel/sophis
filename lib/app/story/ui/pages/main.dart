import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
import 'package:sophis/app/story/domain/chapters.dart';

class PhilosopherStoryView extends StatefulWidget {
  const PhilosopherStoryView({super.key});

  @override
  State<PhilosopherStoryView> createState() => _PhilosopherStoryViewState();
}

class _PhilosopherStoryViewState extends State<PhilosopherStoryView> {
  final _controller = PageController();
  final _chapters = StoryChapters.values;

  @override
  void initState() {
    super.initState();
    // _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<PhilosophersCubit>();
    final philosopher = bloc.state;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(''),
            Expanded(
              child: PageView.builder(
                itemCount: _chapters.length,
                controller: _controller,
                itemBuilder: (context, index) {
                  return const Text('A');
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
