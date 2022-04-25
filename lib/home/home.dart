import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/home/splash_view.dart';

import '../initializers/initializers_manager.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InitializersManager _initializersManager = Get.put(
      InitializersManager(),
    );

    return GetMaterialApp(
      title: "Kutuphane Rezervasyonu",
      home: SplashView(), //SplashView()
    );
  }
}
