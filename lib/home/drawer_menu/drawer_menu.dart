import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/fakulte/screens/fakulte_list_view.dart';
import 'package:library_reservation_liberta_flutter/actions/kurum/screens/kurum_list_view.dart';
import 'package:library_reservation_liberta_flutter/home/home_view.dart';
import 'package:library_reservation_liberta_flutter/home/user/home_view_user.dart';
import 'package:library_reservation_liberta_flutter/settings/actions/themes/panachefile/dark_theme.dart';
import 'package:library_reservation_liberta_flutter/settings/screens/settings_view.dart';
import 'package:library_reservation_liberta_flutter/widgets/background_gradient.dart';

import '../../core/login/auth_manager.dart';
import '../../settings/actions/themes/initial_function/themes.dart';
import '../../settings/actions/themes/screens/themes_controller.dart';
import '../../settings/actions/themes/screens/themes_view.dart';
import '../../widgets/icon_widget.dart';
import '/accounts/login/screens/login_view.dart';
import '/actions/salon/screens/salon_list_view.dart';

import '/actions/birim/screens/birim_list_view.dart';
import 'drawer_menu_controller.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  late final AuthenticationManager _authManager = Get.find();

  @override
  Widget build(BuildContext context) {
    DrawerMenuController controller = Get.put(DrawerMenuController());
    return Container(
      child: drawerMenu(context, controller),
    );
  }

  Drawer drawerMenu(context, controller) {
    return Drawer(
      child: Container(
        //decoration: pageBackgroundGradient(context),
        child: Column(
          children: [
            userAccountDrawerCustom(context, controller),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(0.0),
                children: [
                  menuListItem(
                    Icons.person_outline_rounded,
                    "Profilim",
                    FakulteListView(),
                  ),
                  menuListItem(
                    Icons.schedule,
                    "İşlemlerim",
                    FakulteListView(),
                  ),
                  menuListItem(
                    Icons.question_answer_outlined,
                    "SSS",
                    FakulteListView(),
                  ),
                  menuListItem(
                    Icons.question_mark,
                    "Yardım",
                    FakulteListView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader userAccountDrawerCustom(context, controller) {
    ThemesController themesController = ThemesController();
    return UserAccountsDrawerHeader(
      accountEmail: Obx(() => Text(controller.userEmail.value ?? "")),
      // decoration: BoxDecoration(
      //   color: Theme.of(context).textTheme.titleSmall!.color,
      // ),
      accountName: Text('Ahmet Ozkan'),
      otherAccountsPictures: [
        InkWell(
          onTap: () => _authManager.logOut(),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).cardColor,
            child: Icon(
              Icons.logout,
              //color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(
              () => SettingsView(),
              transition: Transition.rightToLeft,
            );
          },
          child: CircleAvatar(
            backgroundColor: Theme.of(context).cardColor,
            child: Icon(
              Icons.settings,
              // color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (controller.icon == Icons.dark_mode_outlined) {
                themesController.saveDarkTheme(
                  EnumThemeData.darkTheme,
                );
                print("Dark Mode");
                Get.changeTheme(darkTheme);
                controller.icon = Icons.wb_sunny_outlined;
              } else {
                print("Light Mode");
                themesController.removeDarkTheme();
                initialTheme();
                controller.icon = Icons.dark_mode_outlined;
              }
            });
          },
          child: CircleAvatar(
            backgroundColor: Theme.of(context).cardColor,
            child: Icon(
              controller.icon,
            ),
          ),
        ),
      ],
      // currentAccountPicture: CircleAvatar(
      //   backgroundColor: Color.fromARGB(255, 51, 50, 50),
      //   backgroundImage: NetworkImage(
      //       "https://avatars.githubusercontent.com/u/65506828?v=4"),
      // ),
    );
  }

  SizedBox menuItemsSizedBox() {
    return SizedBox(
      height: 3.0,
    );
  }

  Widget menuListItem(IconData icon, String menuItemName, Widget route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        menuItemName,
        style: TextStyle(),
      ),
      onTap: () {
        Get.to(() => route, //next page class
            // duration:
            //     Duration(seconds: 1), //duration of transitions, default 1 sec
            transition: Transition.rightToLeft //transition effect
            );
      },
    );
  }
}
