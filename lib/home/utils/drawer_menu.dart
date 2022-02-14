import 'package:flutter/material.dart';
import 'package:library_reservation_liberta_flutter/home/cc.dart';

import '../../login/login_view.dart';
import '../home.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  List<String> menuItems = [
    "Birim",
    "Salon",
    "Blok",
    "Masa",
    "Kitap Tavsiyeleri"
  ];
  List<String> menuItemss = [""];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomeVieww()));
            },
            child:
                // DrawerHeader(
                //   decoration: BoxDecoration(
                //     color: Color.fromARGB(255, 151, 89, 89),
                //   ),
                //   child: Card(
                //     child: SingleChildScrollView(
                //       child: ExpansionTile(
                //         title: Text("info@yahoo.com"),
                //         leading: Icon(
                //           Icons.person_outline_sharp,
                //         ),
                //         children: <Widget>[
                //           ListTile(
                //             title: Center(
                //               child: Text("Salon Oluştur"),
                //             ),
                //             onTap: () {},
                //           ),
                //           ListTile(
                //             title: Center(
                //               child: Text("Salon Oluştur"),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                UserAccountsDrawerHeader(
              accountEmail: Text('ahmetozkanio@yahoo.com'),
              currentAccountPicture: Image(image: AssetImage('/user.jpg')),
              accountName: Row(
                children: <Widget>[
                  // Container(
                  //   width: 50,
                  //   height: 50,
                  //   decoration: BoxDecoration(shape: BoxShape.circle),
                  //   child: CircleAvatar(
                  //     backgroundColor: Colors.white,
                  //     child: Icon(
                  //       Icons.check,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Ahmet Ozkan'),
                      Text('Kullanici'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.dashboard,
              ),
              title: Text(
                menuItems[0],
                style: TextStyle(),
              ),
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 3.0,
          ),
          Card(
            child: ExpansionTile(
              title: Text(menuItems[1]),
              leading: Icon(
                Icons.meeting_room_outlined,
              ),
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(),
                  child: ListTile(
                    title: Center(
                      child: Text("Salon Oluştur"),
                    ),
                    onTap: () {},
                  ),
                ),
                ListTile(
                  title: Center(
                    child: Text("Salon Oluştur"),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text(menuItems[2]),
              leading: Icon(Icons.meeting_room_outlined),
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Center(
                      child: Text("Salon Oluştur"),
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Center(
                      child: Text("Salon Oluştur"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text(menuItems[3]),
              leading: Icon(Icons.meeting_room_outlined),
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Center(
                      child: Text("Salon Oluştur"),
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Center(
                      child: Text("Salon Oluştur"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.save,
              ),
              title: Text(
                menuItems[4],
                style: TextStyle(),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
