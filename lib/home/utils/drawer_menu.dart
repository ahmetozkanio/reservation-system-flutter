import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/settings/themes/screens/themes_view.dart';
import '../../settings/themes/panachefile/amber_theme.dart';
import '/accounts/login/screens/login_view.dart';
import '/actions/salon/screens/salon_list_view.dart';

import '/actions/birim/screens/birim_list_view.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  List<String> menuItems = [
    "Birimler",
    "Salonlar",
    "Bloklar",
    "Masalar",
    "Kitap Tavsiyeleri",
    "Sıkça Sorulan Sorular"
  ];

  List<IconData> iconData = [
    Icons.dashboard,
  ];

  List<String> menuItemss = [""];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: drawerMenu(context),
    );
  }

  Drawer drawerMenu(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: [
          userAccountDrawerCustom(context),
          menuListItem(iconData[0], menuItems[0], BirimListView()),
          menuItemsSizedBox(),
          menuListItem(iconData[0], menuItems[1], SalonListView()),
          menuItemsSizedBox(),
          menuListItem(iconData[0], menuItems[2], BirimListView()),
          menuItemsSizedBox(),
          menuListItem(iconData[0], menuItems[3], BirimListView()),
          menuItemsSizedBox(),
          menuListItem(iconData[0], menuItems[4], BirimListView()),
          menuItemsSizedBox(),
          menuListItem(iconData[0], menuItems[5], BirimListView()),
          menuItemsSizedBox(),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader userAccountDrawerCustom(context) {
    return UserAccountsDrawerHeader(
      accountEmail: Text('ahmetozkanio@yahoo.com'),
      // decoration: BoxDecoration(
      //   color: Theme.of(context).textTheme.titleSmall!.color,
      // ),
      accountName: Text('Ahmet Ozkan'),
      otherAccountsPictures: [
        InkWell(
          onTap: () =>
              Get.to(() => LoginView(), transition: Transition.upToDown),
          child: CircleAvatar(
              backgroundColor: Theme.of(context).cardColor,
              child: Icon(
                Icons.logout,
                //color: Theme.of(context).iconTheme.color,
              )),
        ),
        InkWell(
          onTap: () {
            Get.isDarkMode
                ? Get.changeTheme(amberTheme)
                : Get.changeTheme(ThemeData.dark());
          },
          child: CircleAvatar(
              backgroundColor: Theme.of(context).cardColor,
              child: Icon(
                Icons.settings,
                // color: Theme.of(context).iconTheme.color,
              )),
        ),
        InkWell(
          onTap: () {
            Get.to(() => ThemesView());
          },
          child: CircleAvatar(
              backgroundColor: Theme.of(context).cardColor,
              child: Icon(
                Icons.settings,
                // color: Theme.of(context).iconTheme.color,
              )),
        ),
      ],
      currentAccountPicture: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 51, 50, 50),
        backgroundImage: NetworkImage(
            "https://avatars.githubusercontent.com/u/65506828?v=4"),
      ),
    );
  }

  SizedBox menuItemsSizedBox() {
    return SizedBox(
      height: 3.0,
    );
  }

  Widget menuListItem(IconData icon, menuItems, Widget route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        menuItems,
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
