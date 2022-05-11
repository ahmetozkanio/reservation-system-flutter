import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      body: SafeArea(child: homeUserBody(context, homeViewUserController)),
    );
  }

  dynamic searchOnChanged(value) {}
  Container homeUserBody(context, homeViewUserController) => Container(
        // decoration: pageBackgroundGradient(context),
        child: LayoutBuilder(builder: (context, constraints) {
          return CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(
                  12.0,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "GAUN",
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontSize),
                      ),
                      Text("Merkez Kutuphane")
                    ],
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
                        context,
                        searchOnChanged,
                        "Salon Ara",
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 218, 218, 218),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(24, 24)),
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
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(
                  12.0,
                ),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: cardGridViewCrossAxisCount(constraints),
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: cardGridViewAspect(constraints),
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Obx(
                        () => homeViewUserController.isLoading.value
                            ? Shimmer.fromColors(
                                baseColor: Color.fromARGB(
                                  255,
                                  207,
                                  207,
                                  207,
                                ),
                                highlightColor:
                                    Color.fromARGB(255, 230, 229, 229),
                                child: shimmerContainer(context),
                              )
                            : FlipCard(
                                fill: Fill
                                    .fillBack, // Fill the back side of the card to make in the same size as the front.
                                direction: FlipDirection.HORIZONTAL, // default
                                front: salonCardFront(index),
                                back: salonCardBack(
                                  index,
                                ),
                              ),
                      );
                    },
                    childCount: 5,
                  ),
                ),
              ),
            ],
          );
        }),
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
        width: double.minPositive,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SALON ON SALON ON fdasdasd asd asda ds adasd asd asdas d $index',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        maxLines: 3,
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

                  //
                  Column(
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
                        height: 1.0,
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
                        height: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularPercentIndicator(
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
                  ElevatedButton(
                    onPressed: () {
                      Get.to(
                        () => ReservationView(),
                        transition: Transition.zoom,
                      );
                    },
                    child: Text(
                      'Rezervasyon',
                      style: TextStyle(
                        fontSize: 7.0,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Container shimmerContainer(context) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(width: 1.0, color: const Color(0xFFFFFFFF)),
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
              Container(
                width: MediaQuery.of(context).size.width * 0.56,
                height: 12,
                color: Colors.white,
              ),
              SizedBox(
                height: 4.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.44,
                height: 12,
                color: Colors.white,
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: 12,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.24,
                    height: 12,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.24,
                    height: 12,
                    color: Colors.white,
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
            progressColor: Colors.green,
            backgroundColor: Colors.grey[300]!,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            width: 96,
            height: 32,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

cardGridViewAspect(BoxConstraints constraints) {
  if (constraints.maxWidth > 1200) {
    return 2;
  } else if (constraints.maxWidth > 964) {
    return 3;
  } else if (constraints.maxWidth > 888) {
    return 2.4;
  } else if (constraints.maxWidth > 828) {
    return 2;
  } else if (constraints.maxWidth > 728) {
    return 1.8;
  } else if (constraints.maxWidth > 658) {
    return 1.6;
  } else if (constraints.maxWidth > 600) {
    return 3;
  } else if (constraints.maxWidth > 458) {
    return 2.5;
  }
  return 2;
}

cardGridViewCrossAxisCount(BoxConstraints constraints) {
  if (constraints.maxWidth > 1200) {
    return 3;
  } else if (constraints.maxWidth > 658) {
    return 2;
  }
  return 1;
}

 // SliverAppBar(
            //   backgroundColor: Colors.transparent,
            //   pinned: false,
            //   elevation: 6.0,
            //   expandedHeight: MediaQuery.of(context).size.height / 8,
            //   flexibleSpace: FlexibleSpaceBar(
            //     titlePadding:
            //         EdgeInsetsDirectional.only(start: 16, top: 16, bottom: 8),
            //     title: Container(
            //       padding: EdgeInsets.only(
            //         top: 15,
            //       ),
            //       child: SizedBox(
            //         height: 35.0,
            //         child: Stack(
            //           children: [
            //             Container(
            //               alignment: Alignment.topLeft,
            //               child: Text(
            //                 "GAUN",
            //                 style: TextStyle(
            //                   fontSize: Theme.of(context)
            //                       .textTheme
            //                       .bodyLarge!
            //                       .fontSize,
            //                   color:
            //                       Theme.of(context).textTheme.bodySmall!.color,
            //                 ),
            //               ),
            //             ),
            //             Container(
            //               alignment: Alignment.bottomLeft,
            //               child: Text(
            //                 "Kutuphane Salonlari",
            //                 style: TextStyle(
            //                   fontSize: Theme.of(context)
            //                       .textTheme
            //                       .bodySmall!
            //                       .fontSize,
            //                   color:
            //                       Theme.of(context).textTheme.bodySmall!.color,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),