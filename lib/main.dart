import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:library_reservation_liberta_flutter/home/home.dart';

Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await initialization(null);
  runApp(
    Home(),
  );
}

// initialization(BuildContext? context) async {
//   await Future.delayed(Duration(seconds: 3));
// }
// class SplashView extends StatefulWidget {
//   const SplashView({Key? key}) : super(key: key);

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   @override
//   void initState() {
//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/ic_splash.png"), fit: BoxFit.cover)),
//       ),
//     );
//   }
// }
