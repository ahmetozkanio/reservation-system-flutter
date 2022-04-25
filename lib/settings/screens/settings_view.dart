import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/widgets/background_gradient.dart';

import '../../widgets/list_divider.dart';
import '../actions/themes/screens/themes_view.dart';
import '/settings/screens/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(
      SettingsController(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ayarlar"),
      ),
      body: Container(
        decoration: pageBackgroundGradient(context),
        // color: Theme.of(context).secondaryHeaderColor,
        padding: EdgeInsets.only(top: 8),
        child: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      // color: Theme.of(context).primaryColor,
                    ),
                    //  Container(
                    //   width: 24,
                    //   height: 24,
                    //   child: Image.asset("assets/icons/ic_user_profile.png"),
                    // ),
                    style: ListTileStyle.list,
                    title: Text("Profil"),
                    onTap: () {},
                  ),
                  listDivider(context),
                  ListTile(
                    leading: Icon(
                      Icons.color_lens,
                      color: Theme.of(context).primaryColor,
                    ),

                    //  listTileIcon("assets/icons/ic_color_wheel.png"),
                    style: ListTileStyle.list,
                    title: Text("Temalar"),
                    onTap: () {
                      Get.to(() => ThemesView(),
                          transition: Transition.rightToLeft);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
