import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/accounts/login/screens/login_view.dart';

import 'package:library_reservation_liberta_flutter/actions/salon/screens/salon_list_view.dart';

import '../../actions/birim/screens/birim_list_view.dart';

class DrawerMenu extends StatelessWidget {
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
      child: drawerMenu(),
    );
  }

  Drawer drawerMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          userAccountDrawerCustom(),
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

  UserAccountsDrawerHeader userAccountDrawerCustom() {
    return UserAccountsDrawerHeader(
      accountEmail: Text('ahmetozkanio@yahoo.com'),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 135, 152, 161),
      ),
      accountName: Text('Ahmet Ozkan'),
      otherAccountsPictures: [
        InkWell(
          onTap: () =>
              Get.to(() => LoginView(), transition: Transition.upToDown),
          child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.logout,
                color: Color.fromARGB(255, 135, 152, 161),
              )),
        ),
        CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 135, 152, 161),
            )),
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

  Card menuListItem(IconData icon, menuItems, Widget route) {
    return Card(
      child: ListTile(
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
      ),
    );
  }
}


//  Card(
//             child: ExpansionTile(
//               title: Text(menuItems[1]),
//               leading: Icon(
//                 Icons.meeting_room_outlined,
//               ),
//               children: <Widget>[
//                 Container(
//                   decoration: BoxDecoration(),
//                   child: ListTile(
//                     title: Center(
//                       child: Text("Salon Oluştur"),
//                     ),
//                     onTap: () {},
//                   ),
//                 ),
//                 ListTile(
//                   title: Center(
//                     child: Text("Salon Oluştur"),
//                   ),
//                 ),
//               ],
//             ),
//           ),