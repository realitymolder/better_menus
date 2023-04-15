import 'package:flutter/material.dart';

class BottomMenuItem extends StatelessWidget {
  const BottomMenuItem(
      {super.key,
      required this.leading,
      required this.label,
      this.isList = false,
      this.onTap,
      this.route,
      this.router});

  const BottomMenuItem.list(
      {super.key,
      required this.leading,
      required this.label,
      this.isList = true,
      this.onTap,
      this.route,
      this.router});

  final Widget leading;
  final String label;
  final bool isList;
  final VoidCallback? onTap;
  final String? route;
  final dynamic router;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () =>
          onTap != null && router == null ? onTap : router.navigateNamed(route),
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
