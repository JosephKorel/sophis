import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';

class AdviceDialog extends StatelessWidget {
  const AdviceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final philosopher = context.watch<PhilosophersCubit>();
    final title = philosopher.state.getPhilosopher().title();

    void close() {
      Navigator.of(context).pop();
    }

    void handleAsk() {
      final userInput = controller.text;

      if (userInput.isEmpty) {
        _emptyTextSnackbar(context);
        return;
      }
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

void _emptyTextSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Your message must be at least 8 characters length'),
    ),
  );
}
