import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'home_view.dart';
import 'utils/drawer_menu.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SliderDrawer(
      key: _key,
      appBar: SliderAppBar(
        // appBarColor: Color.fromARGB(255, 255, 255, 255),
        // drawerIconColor: Colors.black87,
        appBarColor: Theme.of(context).cardColor,
        drawerIconColor: Theme.of(context).iconTheme.color!,
        title: const Text(
          "Ana Sayfa",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      slider: DrawerMenu(),
      child: HomeView(),
    ));
  }
  // Scaffold(
  //   appBar: AppBar(
  //     title: Text("Appbar"),
  //   ),
  //   drawer: const DrawerMenu(),
  // );
}
