import 'package:flutter/material.dart';

class HorizontalScrollableMenuItem extends StatelessWidget {
  const HorizontalScrollableMenuItem({
    super.key,
    required this.index,
    required this.text,
    required this.onTap,
    required this.pageController,
    this.itemColor = const Color(0xFFFFFFFF),
    this.selectedItemColor = const Color(0xFF000000),
    this.itemTextStyle = const TextStyle(
        color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
    this.selectedItemTextStyle = const TextStyle(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
  });

  final int index;
  final String text;
  final VoidCallback? onTap;
  final PageController pageController;
  final Color? itemColor;
  final Color? selectedItemColor;
  final TextStyle? itemTextStyle;
  final TextStyle? selectedItemTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: GestureDetector(
        onTap: () {
          onTap;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 11,
          ),
          decoration: BoxDecoration(
            color: pageController.page == index.toDouble()
                ? selectedItemColor
                : itemColor,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Center(
            child: Text(
              text,
              style: pageController.page == index.toDouble()
                  ? selectedItemTextStyle
                  : itemTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
