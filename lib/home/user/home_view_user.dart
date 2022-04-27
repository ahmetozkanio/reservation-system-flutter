import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
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
      body: homeUserBody(context, homeViewUserController),
    );
  }

  dynamic searchOnChanged(value) {}
  Container homeUserBody(context, homeViewUserController) => Container(
        // decoration: pageBackgroundGradient(context),
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              pinned: false,
              elevation: 6.0,
              expandedHeight: MediaQuery.of(context).size.height / 8,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding:
                    EdgeInsetsDirectional.only(start: 16, top: 16, bottom: 8),
                title: Container(
                  padding: EdgeInsets.only(
                    top: 15,
                  ),
                  child: SizedBox(
                    height: 35.0,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "GAUN",
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .fontSize,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Kutuphane Salonlari",
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .fontSize,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  SizedBox(
                      height: 28.0,
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: searchTextField(
                          context, searchOnChanged, "Salon Ara")),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 218, 218, 218),
                      borderRadius: BorderRadius.all(Radius.elliptical(24, 24)),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: () {
                      homeViewUserController.isLoading.value
                          ? homeViewUserController.isLoading.value = false
                          : homeViewUserController.isLoading.value = true;
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 218, 218, 218),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(24, 24)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 218, 218, 218),
                      borderRadius: BorderRadius.all(Radius.elliptical(24, 24)),
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(
                12.0,
              ),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Obx(() => homeViewUserController.isLoading.value
                        ? Shimmer.fromColors(
                            baseColor: Color.fromARGB(255, 226, 226, 226),
                            highlightColor: Color.fromARGB(255, 236, 236, 236),
                            child: Card(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  11,
                                ),
                              ),
                            ))
                        : FlipCard(
                            fill: Fill
                                .fillBack, // Fill the back side of the card to make in the same size as the front.
                            direction: FlipDirection.HORIZONTAL, // default
                            front: salonCardFront(index),
                            back: salonCardBack(index)));
                  },
                  childCount: 11,
                ),
              ),
            )
          ],
        ),
      );

  Card salonCardBack(
    int index,
  ) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          11.0,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              11,
            ),
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(
          12.0,
        ),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SALON ARKA $index',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    'Fakulte Adi',
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    'Birim Adi',
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.grey[500],
                        size: 14.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        'Sadece gunluk rezervasyon yapilabilir.',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.people_rounded,
                        color: Colors.grey[500],
                        size: 14.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        'Rezervasyon Yapabilen Kullanicilar: Akademisyen, Oğrenci',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.grey[500],
                        size: 14.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        '0538 396 4617 - 0342 227 0784',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 11.0,
                        ),
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.navigation_rounded,
                        color: Colors.grey[500],
                        size: 14.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        'Salon adresi ve navigation link.',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card salonCardFront(int index) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          11,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              11,
            ),
          ),
        ),
        // width: double.infinity,
        // height: double.infinity,
        padding: EdgeInsets.all(
          12.0,
        ),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SALON ON $index',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    'Fakulte Adi',
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.grey[500],
                        size: 14.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        'Rezervasyon:',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 11.0,
                        ),
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        '10:00 - 18/04/2022',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.people_rounded,
                        color: Colors.grey[500],
                        size: 14.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        'Akademisyen, Oğrenci',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.wifi,
                        color: Colors.grey[500],
                        size: 14.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Icon(
                        Icons.electrical_services,
                        color: Colors.grey[500],
                        size: 14.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Icon(
                        Icons.desktop_mac,
                        color: Colors.grey[500],
                        size: 14.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: CircularPercentIndicator(
                radius: 32.0,
                lineWidth: 7.0,
                percent: 0.8,
                animation: true,
                animationDuration: 2000,
                center: Text(
                  "80%",
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
                progressColor: Colors.green,
                backgroundColor: Colors.grey[300]!,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => ReservationView(),
                    transition: Transition.zoom,
                  );
                },
                child: Text(
                  'Rezervasyon Yap',
                  style: TextStyle(
                    fontSize: 8.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  Expanded(
//                       child: GestureDetector(
//                         onTap: () {},
//                         child: Container(
//                           color: Colors.white,
//                           width: double.infinity,
//                           height: double.infinity,
//                           // width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(11),
//                             ),
//                           ),
//                           child: Align(
//                             alignment: Alignment.bottomCenter,
//                             child: Container(
//                               height: MediaQuery.of(context).size.width / 9,
//                               child: Align(
//                                 child: Text(
//                                   "title",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 13,
//                                     color: Theme.of(context)
//                                         .textTheme
//                                         .bodyLarge!
//                                         .color,
//                                     decoration: TextDecoration.none,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 ),
//                               ),
//                               decoration: const BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(0),
//                                   topRight: Radius.circular(0),
//                                   bottomLeft: Radius.circular(11),
//                                   bottomRight: Radius.circular(11),
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Color.fromRGBO(0, 0, 0, 0.25),
//                                       offset: Offset(0, 4),
//                                       blurRadius: 4)
//                                 ],
//                                 color: Color.fromRGBO(255, 251, 251, 1),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
