import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/home/home_view.dart';
import 'package:library_reservation_liberta_flutter/settings/actions/themes/panachefile/dark_theme.dart';
import 'package:library_reservation_liberta_flutter/settings/screens/settings_view.dart';

import '../../actions/sss/screens/sss_view.dart';
import '../../actions/yardim/screens/yardim_view.dart';
import '../../core/login/auth_manager.dart';
import '../../initializers/themes.dart';
import '../../settings/actions/themes/screens/themes_controller.dart';

import '../../widgets/snackbar.dart';
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
                    Icons.person,
                    "Profilim",
                    HomeView(),
                  ),
                  menuListItem(
                    CupertinoIcons.time_solid,
                    "İşlemlerim",
                    HomeView(),
                  ),
                  menuListItem(
                    Icons.question_answer,
                    "SSS",
                    SSSView(),
                  ),
                  menuListItem(
                    Icons.question_mark,
                    "Yardım",
                    YardimView(),
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
      accountEmail: Obx(
        () => Text(
          controller.userEmail.value ?? "",
          style: TextStyle(
              fontFamily:
                  Theme.of(context).textTheme.bodyLarge!.fontFamily ?? null),
        ),
      ),
      // decoration: BoxDecoration(
      //   color: Theme.of(context).textTheme.titleSmall!.color,
      // ),
      accountName: Text(
        'Ahmet Ozkan',
        style: TextStyle(
          fontFamily: Theme.of(context).textTheme.bodySmall!.fontFamily ?? null,
        ),
      ),
      otherAccountsPictures: [
        InkWell(
          onTap: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Çıkış yapmak istediğinizden emin misiniz?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Vazgeç'),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: const Text('Evet'),
                    onPressed: () {
                      _authManager.logOut();
                    },
                  ),
                ],
              ),
            );
          },
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
        //Dark Mode Aktif edilmesi icin burasi acilmali ...................................................
        // InkWell(
        //   onTap: () {
        //     setState(() {
        //       if (controller.icon == Icons.dark_mode_outlined) {
        //         themesController.saveDarkTheme(
        //           EnumThemeData.darkTheme,
        //         );
        //         // print("Dark Mode");
        //         Get.changeTheme(darkTheme);
        //         controller.icon = Icons.wb_sunny_outlined;
        //       } else {
        //         // print("Light Mode");
        //         themesController.removeDarkTheme();
        //         initialTheme();
        //         controller.icon = Icons.dark_mode_outlined;
        //       }
        //     });
        //   },
        //   child: CircleAvatar(
        //     backgroundColor: Theme.of(context).cardColor,
        //     child: Icon(
        //       controller.icon,
        //     ),
        //   ),
        // ),
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
      dense: true,
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
