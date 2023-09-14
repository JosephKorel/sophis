import 'package:flutter/material.dart';
import 'package:sophis/app/story/domain/chapters.dart';

class ChapterIndicator extends StatelessWidget {
  const ChapterIndicator({required this.currentIndex, super.key});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final indicatorWidget = List.generate(
      HistoryChapters.values.length,
      (index) {
        final active = index == currentIndex;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: active
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
              borderRadius: BorderRadius.circular(active ? 8 : 4),
            ),
            child: SizedBox(
              height: 8,
              width: active ? 16 : 8,
            ),
          ),
        );
      },
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicatorWidget,
    );
  }
}
