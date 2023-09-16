import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
import 'package:sophis/app/story/domain/chapters.dart';
import 'package:sophis/app/story/domain/philosopher_history.dart';
import 'package:sophis/main.dart';

class HistoryChapterView extends StatefulWidget {
  const HistoryChapterView({required this.chapter, super.key});

  final HistoryChapters chapter;

  @override
  State<HistoryChapterView> createState() => _HistoryChapterViewState();
}

class _HistoryChapterViewState extends State<HistoryChapterView> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<PhilosophersCubit>();
    final philosopher = bloc.state;
    final story = philosopher.getPhilosopher().story();
    final content = widget.chapter.content(philosopherStory: story);
    final lastPage = widget.chapter == HistoryChapters.legacy;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.chapter.title,
        ),
        titleTextStyle: GoogleFonts.kadwa(
          textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.9),
                height: 1,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          if (lastPage)
            const SizedBox.shrink()
          else
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.home_outlined),
                style: IconButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: [
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Scrollbar(
                  controller: _controller,
                  child: SingleChildScrollView(
                    controller: _controller,
                    child: SelectableText(
                      content,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 16,
                          ),
                      textAlign: TextAlign.justify,
                    )
                        .animate(delay: .2.seconds)
                        .slideX(
                          begin: 8,
                          duration: .8.seconds,
                          curve: Curves.easeOutCirc,
                        )
                        .shimmer(
                          delay: 1.seconds,
                          color: context.isDark
                              ? Theme.of(context)
                                  .colorScheme
                                  .background
                                  .withOpacity(0.4)
                              : null,
                          duration: 4.seconds,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
