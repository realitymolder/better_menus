import 'package:flutter/material.dart';
import 'package:better_menus/src/widgets/bottom_page_menu_item.dart';

//TODO: Consider putting the main light on the list view of the new bottom menu. That said, create a ticker on the bottom of it (?) to change between menus?

class BottomPageMenu extends StatelessWidget {
  const BottomPageMenu({
    super.key,
    this.borderRadius,
    this.color,
    required this.items,
    this.isList = false,
  });

  const BottomPageMenu.list({
    super.key,
    this.borderRadius,
    this.color,
    required this.items,
    this.isList = true,
  });

  final double? borderRadius;
  final Color? color;
  final List<BottomPageMenuItem> items;
  final bool isList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Material(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
              color: color ??
                  Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
              child: isList
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final BottomPageMenuItem item = items[index];
                        return BottomPageMenuItem.list(
                          leading: item.leading,
                          // emoji: item.emoji,
                          label: item.label,
                          onTap: item.onTap,
                          // page: item.page ?? 'dd',
                        );
                      })
                  : GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 120,
                        crossAxisSpacing: 10,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final BottomPageMenuItem item = items[index];
                        return BottomPageMenuItem(
                          leading: item.leading,
                          label: item.label,
                          onTap: item.onTap,
                          // page: item.page ?? 'dd',
                        );
                      },
                    ),
              // physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuNavigatorButton(text: 'aaa', onTap: () {}),
              MenuNavigatorButton(text: 'bbb', onTap: () {}),
              MenuNavigatorButton(text: 'ccc', onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}

class MenuNavigatorButton extends StatelessWidget {
  const MenuNavigatorButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(text),
    );
  }
}
