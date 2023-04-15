import 'package:flutter/material.dart';
import 'package:better_menus/src/widgets/bottom_menu_item.dart';

//TODO: Consider putting the main light on the list view of the new bottom menu. That said, create a ticker on the bottom of it (?) to change between menus?

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
    this.borderRadius,
    this.color,
    required this.items,
    this.isList = false,
    this.router,
  });

  const BottomMenu.list({
    super.key,
    this.borderRadius,
    this.color,
    required this.items,
    this.isList = true,
    this.router,
  });

  final double? borderRadius;
  final Color? color;
  final List<BottomMenuItem> items;
  final bool isList;
  final dynamic router;

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
                        final BottomMenuItem item = items[index];
                        return BottomMenuItem.list(
                          leading: item.leading,
                          label: item.label,
                          onTap: item.onTap,
                          router: router != null ? router : null,
                          route: item.route,
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
                        final BottomMenuItem item = items[index];
                        return BottomMenuItem(
                          leading: item.leading,
                          label: item.label,
                          onTap: item.onTap,
                          route: item.route,
                          router: router,
                          // page: item.page ?? 'dd',
                        );
                      },
                    ),
              // physics: const NeverScrollableScrollPhysics(),
            ),
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
