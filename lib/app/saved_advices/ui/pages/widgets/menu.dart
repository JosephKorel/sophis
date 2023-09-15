import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophis/app/saved_advices/presenter/cubit/saved_advice_cubit.dart';

enum MenuItems { delete }

class SavedAdviceMenu extends StatelessWidget {
  const SavedAdviceMenu({required this.adviceText, super.key});

  final String adviceText;

  @override
  Widget build(BuildContext context) {
    void onDelete() =>
        context.read<SavedAdviceCubit>().removeAdvice(adviceText: adviceText);

    return PopupMenuButton<MenuItems>(
      onSelected: (_) => onDelete(),
      icon: Icon(
        Icons.more_horiz,
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: EdgeInsets.zero,
      surfaceTintColor: Theme.of(context).colorScheme.background,
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItems>>[
        PopupMenuItem<MenuItems>(
          value: MenuItems.delete,
          padding: EdgeInsets.zero,
          child: ListTile(
            iconColor: Theme.of(context).colorScheme.error,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            dense: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            leading: const Icon(
              Icons.delete,
              size: 20,
            ),
            title: Text(
              'Remove',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
