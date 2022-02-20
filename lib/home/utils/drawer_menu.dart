import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/salon/screens/salon_list_view.dart';
import 'package:page_transition/page_transition.dart';

import '../../actions/birim/screens/birim_list_view.dart';
import '../../login/login_view.dart';
import '../home.dart';

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
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              Get.to(BirimListView());
            },
            child: userAccountDrawerCustom(),
          ),
          menuListItem(iconData[0], menuItems[0], BirimListView(), context),
          menuItemsSizedBox(),
          menuListItem(iconData[0], menuItems[1], BirimListView(), context),
          menuItemsSizedBox(),
          menuListItem(iconData[0], menuItems[2], BirimListView(), context),
          menuItemsSizedBox(),
          menuListItem(iconData[0], menuItems[3], BirimListView(), context),
          menuItemsSizedBox(),
          menuListItem(iconData[0], menuItems[4], BirimListView(), context),
          menuItemsSizedBox(),
          menuListItem(iconData[0], menuItems[5], BirimListView(), context),
          menuItemsSizedBox(),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader userAccountDrawerCustom() {
    return const UserAccountsDrawerHeader(
      accountEmail: Text('ahmetozkanio@yahoo.com'),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 90, 127, 145),
      ),
      accountName: Text('Ahmet Ozkan'),
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

  Card menuListItem(
      IconData icon, menuItems, Widget route, BuildContext context) {
    return Card(
      child: ListTile(
          leading: Icon(icon),
          title: Text(
            menuItems,
            style: TextStyle(),
          ),
          onTap: () => Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft, child: route))),
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