import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:library_reservation_liberta_flutter/settings/themes/core/themes/theme_cache.dart';
import 'package:library_reservation_liberta_flutter/settings/themes/panachefile/amber_theme.dart';

import '../settings/themes/screens/themes_controller.dart';
import 'controller.dart';
import 'home_view.dart';
import 'utils/drawer_menu.dart';

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
