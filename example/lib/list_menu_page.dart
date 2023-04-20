import 'package:better_menus/better_menus.dart';
import 'package:example/ex_scaffold.dart';
import 'package:flutter/material.dart';

class ListMenuPage extends StatefulWidget {
  const ListMenuPage({super.key});

  @override
  State<ListMenuPage> createState() => _ListMenuPageState();
}

class _ListMenuPageState extends State<ListMenuPage> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const BottomMenuItem.list(
        leading: Icon(Icons.window_rounded),
        label: '1st Options',
      ),
      const BottomMenuItem.list(
        leading: Icon(Icons.roller_shades_closed_outlined),
        label: '2nd Options',
      ),
      const BottomMenuItem.list(
        leading: Icon(Icons.ac_unit_outlined),
        label: '3rd Options',
      ),
    ];

    return const ExScaffold(
        appbarTitle: 'Many List Menu + Horizontal',
        topWidget: Icon(
          Icons.chat_rounded,
          size: 200,
        ),
        bottomWidget: Text('')

        //  BottomSectionWrapper(
        //   controller: controller,
        //   titles: const ['what', 'the', 'him'],
        //   itemColor: Colors.red,
        //   selectedItemColor: Colors.black,
        //   // onTap: ()=> controller.jumpToPage(index);,
        //   bottomMenus: [
        //     BottomMenu.list(
        //       items: pages,
        //     ),
        //     const BottomMenu.list(
        //       items: [
        //         BottomMenuItem(leading: Text('wow'), label: 'label'),
        //         BottomMenuItem(leading: Text('wow'), label: 'label'),
        //         BottomMenuItem(leading: Text('wow'), label: 'label'),
        //       ],
        //     ),
        //     const BottomMenu.list(
        //       items: [
        //         BottomMenuItem(leading: Text('wow'), label: 'label'),
        //         BottomMenuItem(leading: Text('wow'), label: 'label'),
        //         BottomMenuItem(leading: Text('wow'), label: 'label'),
        //       ],
        // ),
        // ],
        // )
        );
  }
}
