import 'package:better_menus/better_menus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      BottomPageMenuItem.list(
          leading: const Icon(Icons.window_rounded),
          label: '1st Options',
          onTap: () => Navigator.pushNamed(context, 'first')),
      BottomPageMenuItem.list(
          leading: const Icon(Icons.roller_shades_closed_outlined),
          label: '2nd Options',
          onTap: () => Navigator.pushNamed(context, 'second')),
      BottomPageMenuItem.list(
          leading: const Icon(Icons.ac_unit_outlined),
          label: '3rd Options',
          onTap: () => Navigator.pushNamed(context, 'third')),
    ];

    return MaterialApp(
      home: ExScaffold(
        appbarTitle: 'Modern Menus',
        topWidget: const Icon(
          Icons.chat_rounded,
          size: 200,
        ),
        bottomWidget: BottomWrapper(
          child: BottomPageMenu.list(items: pages),
        ),
      ),
    );
  }
}

class ExScaffold extends StatelessWidget {
  const ExScaffold({
    super.key,
    required this.appbarTitle,
    required this.topWidget,
    required this.bottomWidget,
  });

  final String appbarTitle;
  final Widget topWidget;
  final Widget bottomWidget;
  // final List<BottomNavigationMenuItem> pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        appbarTitle,
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: topWidget,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: bottomWidget,
            ),
          ],
        ),
      ),
    );
  }
}
