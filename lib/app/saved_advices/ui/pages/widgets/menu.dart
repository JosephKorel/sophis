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
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItems>>[
        PopupMenuItem<MenuItems>(
          value: MenuItems.delete,
          padding: EdgeInsets.zero,
          child: ListTile(
            iconColor: Theme.of(context).colorScheme.error,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            leading: const Icon(Icons.delete),
            title: const Text('Remove'),
          ),
        ),
      ],
    );
  }
}

class AdviceMenu extends StatefulWidget {
  const AdviceMenu({super.key});

  @override
  State<AdviceMenu> createState() => _AdviceMenuState();
}

class _AdviceMenuState extends State<AdviceMenu> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MenuAnchor(
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return IconButton(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            icon: const Icon(Icons.more_horiz),
            tooltip: 'Show menu',
          );
        },
        menuChildren: [
          MenuItemButton(
            onPressed: () {},
            child: ListTile(
              tileColor: Theme.of(context).colorScheme.primaryContainer,
              contentPadding: const EdgeInsets.only(right: 8),
              leading: const Icon(Icons.delete),
              title: const Text('Remove'),
            ),
          ),
        ],
      ),
    );
  }
}
