import 'package:better_menus/src/widgets/horizontal_scrollable_menu_item.dart';
import 'package:flutter/material.dart';

class HorizontalScrollableMenu extends StatelessWidget {
  const HorizontalScrollableMenu({
    super.key,
    required this.titles,
    required this.pageController,
    required this.itemColor,
    required this.selectedItemColor,
    this.itemTextStyle = const TextStyle(),
    this.selectedItemTextStyle = const TextStyle(),
  });

  final List titles;
  final PageController pageController;
  final Color itemColor;
  final Color selectedItemColor;
  final TextStyle itemTextStyle;
  final TextStyle selectedItemTextStyle;

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[const SizedBox(width: 16)]; // 16 is start padding
    var index = 0;
    //create a new row widget for each data element
    for (var element in titles) {
      list.add(
        
        HorizontalScrollableMenuItem(

          index: index,
          pageController: pageController,
          text: element,
          itemColor: itemColor,
          selectedItemColor: selectedItemColor,
          itemTextStyle: itemTextStyle,
          selectedItemTextStyle: selectedItemTextStyle,
        ),
      );

      index++;
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      ),
    );
  }
}
