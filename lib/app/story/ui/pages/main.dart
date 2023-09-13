import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
import 'package:sophis/app/story/domain/chapters.dart';
import 'package:sophis/app/story/domain/philosopher_history.dart';

class PhilosopherHistoryView extends StatefulWidget {
  const PhilosopherHistoryView({super.key});

  @override
  State<PhilosopherHistoryView> createState() => _PhilosopherHistoryViewState();
}

class _PhilosopherHistoryViewState extends State<PhilosopherHistoryView> {
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
    final story = philosopher.getPhilosopher().story();

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
                  final content =
                      _chapters[index].content(philosopherStory: story);

                  return SelectableText(content);
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
