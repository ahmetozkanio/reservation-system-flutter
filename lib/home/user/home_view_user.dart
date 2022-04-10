import 'package:flutter/material.dart';
import 'package:library_reservation_liberta_flutter/widgets/background_gradient.dart';

class HomeViewUser extends StatelessWidget {
  const HomeViewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: homeUserBody(context),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.lock),
        )

        // bottomNavigationBar: BottomNavigationBar(
        //   items: [
        //     BottomNavigationBarItem(label: "Ahmet", icon: Icon(Icons.lock)),
        //     BottomNavigationBarItem(label: "Ahmet", icon: Icon(Icons.lock))
        //   ],
        // ),
        );
  }

  Container homeUserBody(context) => Container(
        decoration: pageBackgroundGradient(context),
        child: ListView(children: []),
      );
}
