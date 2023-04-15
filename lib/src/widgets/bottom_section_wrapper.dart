//todo: put a wrapper for multiple bottom page Menus

import 'package:better_menus/better_menus.dart';
import 'package:flutter/material.dart';



class BottomSectionWrapper extends StatelessWidget {
  const BottomSectionWrapper({
    super.key,
    required this.controller,
    this.onTap,
    required this.bottomMenus,
    required this.titles,
    this.itemColor,
    this.selectedItemColor,
  });

  final PageController controller;
  final VoidCallback? onTap;
  final List<BottomMenu> bottomMenus;
  final List titles;
  final Color? itemColor;
  final Color? selectedItemColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: [...bottomMenus],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              height: 40,
              child: HorizontalScrollableMenu(
                itemBuilder: (context,index) => HorizontalScrollableMenuItem(index: index, text: text, onTap: onTap, pageController: pageController),
                
                titles: titles,
                pageController: controller,
                itemColor: itemColor,
                selectedItemColor: selectedItemColor,
                onTap: onTap,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
