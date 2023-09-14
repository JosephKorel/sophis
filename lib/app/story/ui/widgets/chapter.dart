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

    return Padding(
      padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.chapter.title,
                  style: GoogleFonts.kadwa(
                    textStyle:
                        Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.9),
                              height: 1,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                  ),
                )
                    .animate(delay: .2.seconds)
                    .slideY(begin: -8, curve: Curves.easeOutCirc),
              ),
              if (lastPage)
                const SizedBox.shrink()
              else
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.home_outlined),
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.1),
                    foregroundColor: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Scrollbar(
              controller: _controller,
              child: SingleChildScrollView(
                controller: _controller,
                child: SelectableText(
                  content,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
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
        ],
      ),
    );
  }
}
