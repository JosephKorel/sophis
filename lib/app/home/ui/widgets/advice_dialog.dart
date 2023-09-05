import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/app/advice/bloc/advice_bloc.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';

class AdviceDialog extends StatelessWidget {
  const AdviceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final bloc = context.watch<PhilosophersCubit>();

    final philosopher = bloc.state;
    final title = philosopher.getPhilosopher().title();

    void close() {
      Navigator.of(context).pop();
    }

    void handleAsk() {
      final userInput = controller.text;

      /* if (userInput.isEmpty) {
        _showFlushBar(context);
        return;
      } */

      context.read<AdviceBloc>().add(
            FetchAdviceEvent(
              philosopherEntity: philosopher,
              userInput: 'How can i maintain my diet?',
            ),
          );

      close();

      context.go('/advice');
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextField(
                controller: controller,
                minLines: 3,
                maxLines: 4,
                maxLength: 92,
                decoration: InputDecoration(
                  hintText: 'Ex: How can i be more disciplined?',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  counterText: '',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.background,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.2),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: close,
                  child: const Text('Close'),
                ),
                FilledButton(
                  onPressed: handleAsk,
                  child: const Text('ASK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _showFlushBar(BuildContext context) {
  Flushbar<void>(
    message: 'Your message must be at least 8 characters length',
    backgroundColor: Theme.of(context).colorScheme.primary,
    icon: Icon(
      Icons.warning_amber_sharp,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
    duration: 3.seconds,
    animationDuration: .4.seconds,
  ).show(context);
}
