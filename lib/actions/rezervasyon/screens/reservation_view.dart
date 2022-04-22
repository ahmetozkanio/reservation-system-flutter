import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/rezervasyon/screens/reservation_view_controller.dart';
import 'package:group_button/group_button.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      body:
          // Column(
          //   children: [
          //     Center(
          //       child: GroupButton(
          //         controller: controller,
          //         isRadio: true,
          //         buttons: List.generate(25, (i) => '${i + 1}'),
          //         maxSelected: 1,
          //         onSelected: (val, i, selected) =>
          //             debugPrint('Button: $val index: $i selected: $selected'),
          //       ),
          //     ),
          //   ],
          // ),

          Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Reservasyon",
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize),
                textAlign: TextAlign.center,
              ),
              Card(
                elevation: 3.0,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                  ),
                  height: 500,
                  child: Scrollbar(
                    // isAlwaysShown: true,
                    showTrackOnHover: true,
                    thickness: 7,
                    radius: Radius.circular(20),
                    interactive: true,
                    child: ListView(
                      padding: EdgeInsets.all(12.0),
                      shrinkWrap: true,
                      // padding: EdgeInsets.all(12.0),
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var i = 0; i <= 10; i++)
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text("Blok "),
                                Divider(
                                  color: Colors.grey,
                                  height: 2,
                                ),
                                for (var i = 0; i <= 10; i++)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          reservationViewController
                                              .selectedIndex.value = i;
                                        },
                                        child: Card(
                                          // elevation: 2.0,
                                          color: reservationViewController
                                                      .selectedIndex.value ==
                                                  1
                                              ? reservationViewController
                                                  .selectedIndexColor
                                              : reservationViewController
                                                  .disabledIndexColor,
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            alignment: Alignment.center,
                                            child: Text(
                                              "$i",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        elevation: 2.0,
                                        color: Colors.grey[100],
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "$i",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   width: 1,
                                      // ),
                                      Card(
                                        color: Color.fromARGB(255, 209, 36, 36),
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
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              // ),
            ],
          ),
        ),
      ),
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