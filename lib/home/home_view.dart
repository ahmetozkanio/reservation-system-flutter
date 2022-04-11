import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'package:library_reservation_liberta_flutter/home/drawer_menu/drawer_menu.dart';
import 'package:library_reservation_liberta_flutter/home/user/home_view_user.dart';

import 'Admin/home_view_admin.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final HomeController homeViewController = Get.put(HomeController());

  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        key: _key,
        appBar: SliderAppBar(
          appBarColor: Theme.of(context).secondaryHeaderColor,
          drawerIconColor: Theme.of(context).iconTheme.color!,
          title: const Text(
            "Ana Sayfa",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        slider: const DrawerMenu(),
        child: HomeViewAdmin(),
      ),
    );
  }
}
