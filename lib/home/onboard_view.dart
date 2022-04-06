import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../accounts/login/screens/login_view.dart';
import '../core/login/auth_manager.dart';
import 'home_view.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? HomeView() : LoginView();
    });
  }
}
