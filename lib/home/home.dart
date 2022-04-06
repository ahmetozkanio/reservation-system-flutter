import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/home/splash_view.dart';
import 'package:library_reservation_liberta_flutter/settings/actions/themes/initial_function/themes.dart';
import 'package:library_reservation_liberta_flutter/widgets/appbar.dart';

import '../settings/actions/themes/screens/themes_controller.dart';
import 'controller.dart';
import 'drawer_menu/drawer_menu.dart';
import 'home_view.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeBaseController homeBaseController = Get.put(
      HomeBaseController(),
    ); //Tema başlatma için gerekli

    return GetMaterialApp(
      title: "Kutuphane Rezervasyonu",
      home: SplashView(),
    );
  }

  // Scaffold homeViewScaffold(BuildContext context) {
  //   return Scaffold(
  //      // appBar: globalAppBar(context, "title", null),
  //       body: SliderDrawer(
  //         key: _key,

  //          SliderAppBar(
  //           appBarColor: ThemesController.backgroundColor(context),
  //           // drawerIconColor: Theme.of(context).cardColor,
  //           title: Text(
  //             "Ana Sayfa",
  //             style: TextStyle(
  //               fontSize: 22,
  //             ),
  //           ),
  //         ),
  //         slider: const DrawerMenu(),
  //         child: HomeView(),
  //       ));
  // }
  // Scaffold(
  //   appBar: AppBar(
  //     title: Text("Appbar"),
  //   ),
  //   drawer: const DrawerMenu(),
  // );
}
