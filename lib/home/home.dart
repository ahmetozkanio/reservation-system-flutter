import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'drawer_menu/drawer_menu.dart';
import 'home_view.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    HomeBaseController controller = Get.put((HomeBaseController()));
    return GetMaterialApp(
      home: Scaffold(
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
        slider: const DrawerMenu(),
        child: HomeView(),
      )),
    );
  }
  // Scaffold(
  //   appBar: AppBar(
  //     title: Text("Appbar"),
  //   ),
  //   drawer: const DrawerMenu(),
  // );
}
