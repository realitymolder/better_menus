import 'package:flutter/material.dart';

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
