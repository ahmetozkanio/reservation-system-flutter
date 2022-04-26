import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:library_reservation_liberta_flutter/actions/rezervasyon/screens/reservation_view_controller.dart';
import 'package:library_reservation_liberta_flutter/widgets/appbar.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    ReservationViewController reservationViewController = Get.put(
      ReservationViewController(),
    );
    var groupValue;
    var value;
    // final controller = GroupButtonController(
    //   // selectedIndex: 20,
    //   // selectedIndexes: [0, 1, 2, 3, 4],
    //   disabledIndexes: [10, 12, 13, 14, 15, 23],
    //   onDisablePressed: (i) => print('Button #$i is disabled'),
    // );

    return Scaffold(
        appBar: globalAppBar(context, "Reservasyon", null),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate(
                [
                  Card(
                    elevation: 3.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (int i = 0; i < 10; i++)
                              Container(
                                width: 100.0,
                                padding: EdgeInsets.all(12.0),
                                // decoration: BoxDecoration(),
                                child: Column(
                                  children: [
                                    Text("Blok $i"),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                                  3 +
                                              48,
                                      child: GridView(
                                        // physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 0,
                                          mainAxisSpacing: 0,
                                          childAspectRatio: 1,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          for (int i = 0; i < 20; i++)
                                            Card(
                                              color: Color.fromARGB(
                                                  255, 209, 36, 36),
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "$i",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          child: Text("Reservasyon "),
                        ),
                        Obx(() => Container(
                              child: GFCheckboxListTile(
                                type: GFCheckboxType.circle,
                                title: Text("Rasgele rezervasyon yap"),
                                subTitle: Text(
                                  "Sandalyenizi otomatik seçer",
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                size: GFSize.SMALL,
                                activeBgColor: GFColors.SUCCESS,
                                onChanged: (value) {
                                  reservationViewController.isChecked.value =
                                      value;
                                },
                                value:
                                    reservationViewController.isChecked.value,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              )),
            ],
          ),
        )

        //  SafeArea(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.max,
        //     children: [
        //       // Text(
        //       //   "Salon ",
        //       //   style: TextStyle(
        //       //       fontSize: Theme.of(context).textTheme.titleLarge!.fontSize),
        //       //   textAlign: TextAlign.center,
        //       // ),
        //       Card(
        //         elevation: 3.0,
        //         child:
        //             // Container(
        //             //   padding: EdgeInsets.only(
        //             //     top: 12.0,
        //             //     bottom: 12.0,
        //             //   ),
        //             //   height: 500,
        //             //   child:
        //             Scrollbar(
        //           //  isAlwaysShown: true,
        //           showTrackOnHover: true,
        //           thickness: 7,
        //           radius: Radius.circular(20),
        //           interactive: true,
        //           child: ListView(
        //             padding: EdgeInsets.all(12.0),
        //             shrinkWrap: true,
        //             // padding: EdgeInsets.all(12.0),
        //             scrollDirection: Axis.horizontal,
        //             children: [
        //               Container(
        //                 width: 200,
        //                 child: GridView(
        //                   padding: EdgeInsets.zero,
        //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                     crossAxisCount: 2,
        //                     crossAxisSpacing: 10,
        //                     mainAxisSpacing: 10,
        //                     childAspectRatio: 1,
        //                   ),
        //                   scrollDirection: Axis.vertical,
        //                   children: [
        //                     Container(width: 12, height: 12, color: Colors.red),
        //                     Container(width: 12, height: 12, color: Colors.red),
        //                     Container(width: 12, height: 12, color: Colors.red),
        //                   ],
        //                 ),
        //               ),
        //               Container(
        //                 width: 200,
        //                 child: GridView(
        //                   padding: EdgeInsets.zero,
        //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                     crossAxisCount: 2,
        //                     crossAxisSpacing: 10,
        //                     mainAxisSpacing: 10,
        //                     childAspectRatio: 1,
        //                   ),
        //                   scrollDirection: Axis.vertical,
        //                   children: [
        //                     Container(width: 12, height: 12, color: Colors.red),
        //                     Container(width: 12, height: 12, color: Colors.red),
        //                     Container(width: 12, height: 12, color: Colors.red),
        //                   ],
        //                 ),
        //               ),
        //               // for (var i = 0; i <= 10; i++)
        //               //   Padding(
        //               //     padding: EdgeInsets.all(8.0),
        //               //     child: Column(
        //               //       mainAxisSize: MainAxisSize.max,
        //               //       children: [
        //               //         Text("Blok "),
        //               //         Divider(
        //               //           color: Colors.grey,
        //               //           height: 2,
        //               //         ),
        //               //         for (var i = 0; i <= 10; i++)
        //               //           Row(
        //               //             mainAxisSize: MainAxisSize.max,
        //               //             children: [
        //               //               GestureDetector(
        //               //                 onTap: () {
        //               //                   reservationViewController
        //               //                       .selectedIndex.value = i;
        //               //                 },
        //               //                 child: Card(
        //               //                   // elevation: 2.0,
        //               //                   color: reservationViewController
        //               //                               .selectedIndex.value ==
        //               //                           1
        //               //                       ? reservationViewController
        //               //                           .selectedIndexColor
        //               //                       : reservationViewController
        //               //                           .disabledIndexColor,
        //               //                   child: Container(
        //               //                     width: 24,
        //               //                     height: 24,
        //               //                     alignment: Alignment.center,
        //               //                     child: Text(
        //               //                       "$i",
        //               //                       textAlign: TextAlign.center,
        //               //                     ),
        //               //                   ),
        //               //                 ),
        //               //               ),
        //               //               Card(
        //               //                 elevation: 2.0,
        //               //                 color: Colors.grey[100],
        //               //                 child: Container(
        //               //                   width: 24,
        //               //                   height: 24,
        //               //                   alignment: Alignment.center,
        //               //                   child: Text(
        //               //                     "$i",
        //               //                     textAlign: TextAlign.center,
        //               //                   ),
        //               //                 ),
        //               //               ),
        //               //               // SizedBox(
        //               //               //   width: 1,
        //               //               // ),
        //               //               Card(
        //               //                 color: Color.fromARGB(255, 209, 36, 36),
        //               //                 child: Container(
        //               //                   width: 24,
        //               //                   height: 24,
        //               //                   alignment: Alignment.center,
        //               //                   child: Text(
        //               //                     "$i",
        //               //                     style: TextStyle(
        //               //                       color: Colors.white,
        //               //                     ),
        //               //                     textAlign: TextAlign.center,
        //               //                   ),
        //               //                 ),
        //               //               ),
        //               //             ],
        //               //           ),
        //               //       ],
        //               //     ),
        //               //   ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       // ),
        //       CheckboxListTile(
        //         activeColor: Colors.pink[300],
        //         dense: true,

        //         title: new Text(
        //           "Rasgele Yerleştirme",
        //           style: TextStyle(fontSize: 12, letterSpacing: 0.5),
        //         ),
        //         value: true,
        //         // secondary: Container(
        //         //   height: 50,
        //         //   width: 50,
        //         //   child: Icon(
        //         //     Icons.phone,
        //         //   ),
        //         // ),
        //         onChanged: (val) {},
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}

Widget reservationSingleSelectButton(
  var index,
) {
  return OutlinedButton(onPressed: () {}, child: Text("$index"));
}
// for (var i = 0; i <= 10; i++)
//   Row(
//     mainAxisSize: MainAxisSize.max,
//     children: [
//       Card(
//         elevation: 2.0,
//         color: Colors.grey[100],
//         child: Container(
//           width: 24,
//           height: 24,
//           alignment: Alignment.center,
//           child: Text(
//             "$i",
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//       // SizedBox(
//       //   width: 1,
//       // ),
//       Card(
//         color: Color.fromARGB(255, 209, 36, 36),
//         child: Container(
//           width: 24,
//           height: 24,
//           alignment: Alignment.center,
//           child: Text(
//             "$i",
//             style: TextStyle(
//               color: Colors.white,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     ],
//   ),
