import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';

class AdviceDialog extends StatefulWidget {
  const AdviceDialog({super.key});

  @override
  State<AdviceDialog> createState() => _AdviceDialogState();
}

class _AdviceDialogState extends State<AdviceDialog> {
  @override
  Widget build(BuildContext context) {
    final philosopher = context.watch<PhilosophersCubit>();
    final title = philosopher.state.getPhilosopher().title();

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
            TextField(
              minLines: 3,
              maxLines: 4,
              decoration: InputDecoration(
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
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Close'),
                ),
                FilledButton(
                  onPressed: () {},
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
