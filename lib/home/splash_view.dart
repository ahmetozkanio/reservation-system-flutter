import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../core/login/auth_manager.dart';
import 'onboard_view.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);
  final AuthenticationManager _authmanager = Get.put(
    AuthenticationManager(),
  );

  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initializeSettings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return waitingView();
          } else if (snapshot.hasError) {
            return errorView(snapshot);
          }

          return const OnBoard();
        });
  }
}

Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
  return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
}

Scaffold waitingView() {
  return Scaffold(
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: CupertinoActivityIndicator(
          //     radius: 14.0,
          //   ),
          // ),

          Lottie.asset('assets/lottie/book_loading2.json',
              width: 256.0, height: 256.0, fit: BoxFit.fill),
          Container(
            child: Text(
              'Yükleniyor...',
              style: TextStyle(fontSize: 12.0),
            ),
          )
        ],
      ),
    ),
  );
}
