import 'package:better_menus/src/widgets/horizontal_scrollable_menu_item.dart';
import 'package:flutter/material.dart';

typedef NullableIndexedWidgetBuilder = Widget? Function(
    BuildContext context, int index);

class HorizontalScrollableMenu extends StatefulWidget {
  const HorizontalScrollableMenu({
    Key? key,
    required this.titles,
    required this.pageController,
    required this.itemBuilder,
    this.onTap,
    this.itemColor,
    this.selectedItemColor,
    this.itemTextStyle,
    this.selectedItemTextStyle,
  }) : super(key: key);

  final List titles;
  final PageController pageController;
  final NullableIndexedWidgetBuilder itemBuilder;
  final VoidCallback? onTap;
  final Color? itemColor;
  final Color? selectedItemColor;
  final TextStyle? itemTextStyle;
  final TextStyle? selectedItemTextStyle;

  @override
  State<HorizontalScrollableMenu> createState() =>
      _HorizontalScrollableMenuState();
}

class _HorizontalScrollableMenuState extends State<HorizontalScrollableMenu> {
  @override
  Widget build(BuildContext context) {
    var list = <Widget>[const SizedBox(width: 16)]; // 16 is start padding
    var index = 0;
    //create a new row widget for each data element
    for (var element in widget.titles) {
      list.add(
        HorizontalScrollableMenuItem(
          pageController: widget.pageController,
          index: 2,
          onTap: widget.onTap,
          text: element,
          itemColor: widget.itemColor,
          selectedItemColor: widget.selectedItemColor,
          itemTextStyle: widget.itemTextStyle,
          selectedItemTextStyle: widget.selectedItemTextStyle,
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
