import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'package:library_reservation_liberta_flutter/home/drawer_menu/drawer_menu.dart';
import 'package:library_reservation_liberta_flutter/home/user/home_view_user.dart';

class HomeView extends StatelessWidget {
  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        key: _key,
        appBar: SliderAppBar(
          appBarColor: Theme.of(context).scaffoldBackgroundColor,
          drawerIconColor: Theme.of(context).iconTheme.color!,
          title: const Text(
            "Ana Sayfa",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        slider: const DrawerMenu(),
        child: HomeViewUser(),
      ),
    );
  }
}
