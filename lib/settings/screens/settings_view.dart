import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        padding: EdgeInsets.only(top: 8),
        child: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  // InkWell(
                  //     onTap: () {},
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Column(
                  //         children: [
                  //           Row(
                  //             children: [
                  //               Icon(Icons.verified_user),
                  //               SizedBox(
                  //                 width: 24,
                  //               ),
                  //               Text("data"),
                  //             ],
                  //           ),
                  //           Divider(
                  //             height: 5,
                  //           )
                  //         ],
                  //       ),
                  //     )),
                  ListTile(
                    leading: Container(
                      width: 24,
                      height: 24,
                      child: Image.asset("assets/icons/ic_user_profile.png"),
                    ),
                    style: ListTileStyle.list,
                    title: Text("Profil"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Container(
                        width: 24,
                        height: 24,
                        child: Image.asset("assets/icons/ic_color_wheel.png")),
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
