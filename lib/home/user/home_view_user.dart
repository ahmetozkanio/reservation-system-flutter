import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:library_reservation_liberta_flutter/actions/admin/salon/screens/salon_list_view.dart';
import 'package:library_reservation_liberta_flutter/home/user/home_controller_user.dart';

import 'package:library_reservation_liberta_flutter/widgets/background_gradient.dart';
import 'package:library_reservation_liberta_flutter/widgets/searchList.dart';
import 'package:flip_card/flip_card.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

import '../../actions/rezervasyon/screens/reservation_view.dart';

class HomeViewUser extends StatelessWidget {
  const HomeViewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewUserController homeViewUserController =
        Get.put(HomeViewUserController());
    return Scaffold(
      body: SafeArea(
        child: SalonListView(),
      ),
    );
  }
}
