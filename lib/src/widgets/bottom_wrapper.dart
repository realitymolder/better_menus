//todo: put a wrapper for multiple bottom page Menus

import 'package:flutter/material.dart';

class BottomWrapper extends StatelessWidget {
  const BottomWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
