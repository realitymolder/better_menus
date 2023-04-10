import 'package:flutter/material.dart';

class BottomMenuItem extends StatelessWidget {
  const BottomMenuItem(
      {super.key,
      required this.leading,
      required this.label,
      this.isList = false,
      required this.onTap});

  const BottomMenuItem.list(
      {super.key,
      required this.leading,
      required this.label,
      this.isList = true,
      required this.onTap});

  final Widget leading;
  final String label;
  final bool isList;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => onTap,
      child: isList
          ? LimitedBox(
              child: ListTile(
                leading: leading,
                dense: true,
                title: Text(label),
              ),
            )
          : LimitedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: theme.bottomNavigationBarTheme.unselectedItemColor,
                      fontSize: theme.textTheme.labelMedium!.fontSize,
                      fontWeight: theme.textTheme.labelMedium!.fontWeight,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
