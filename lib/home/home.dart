import 'package:flutter/material.dart';

import 'utils/drawer_menu.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar"),
      ),
      drawer: const DrawerMenu(),
    );
  }
}
