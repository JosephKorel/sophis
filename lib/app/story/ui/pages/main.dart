import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sophis/app/story/domain/chapters.dart';
import 'package:sophis/app/story/ui/widgets/chapter.dart';
import 'package:sophis/app/story/ui/widgets/indicator.dart';

class PhilosopherHistoryView extends StatefulWidget {
  const PhilosopherHistoryView({super.key});

  @override
  State<PhilosopherHistoryView> createState() => _PhilosopherHistoryViewState();
}

class _PhilosopherHistoryViewState extends State<PhilosopherHistoryView> {
  late int pageIndex;
  final _controller = PageController();
  final _chapters = HistoryChapters.values;

  void _updatePage(int index) {
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
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageIndex = _controller.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(''),
          Expanded(
            child: PageView.builder(
              itemCount: _chapters.length,
              controller: _controller,
              onPageChanged: _updatePage,
              itemBuilder: (context, index) {
                return HistoryChapterView(chapter: _chapters[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 4),
            child: ChapterIndicator(currentIndex: pageIndex),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (pageIndex == 0)
                  const SizedBox()
                else
                  TextButton.icon(
                    onPressed: _previousPage,
                    label: const Text('Previous'),
                    icon: const Icon(Icons.keyboard_arrow_left_rounded),
                  ).animate().slideY(
                        begin: 4,
                        curve: Curves.easeOutCirc,
                      ),
                if (pageIndex == _chapters.length - 1)
                  FilledButton.icon(
                    onPressed: _nextPage,
                    label: const Text('Home'),
                    icon: const Icon(Icons.home),
                  ).animate().slideX(
                        begin: 4,
                        curve: Curves.easeOutCirc,
                      )
                else
                  FilledButton.icon(
                    onPressed: _nextPage,
                    label: const Text('Next'),
                    icon: const Icon(Icons.keyboard_arrow_right_rounded),
                  ).animate().slideX(
                        begin: 4,
                        curve: Curves.easeOutCirc,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
