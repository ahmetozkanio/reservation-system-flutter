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
    );

    return GetMaterialApp(
      title: "Kutuphane Rezervasyonu",
      home: SplashView(),
    );
  }
}
