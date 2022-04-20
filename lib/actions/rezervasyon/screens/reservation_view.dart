import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/rezervasyon/screens/reservation_view_controller.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    ReservationViewController reservationViewController = Get.put(
      ReservationViewController(),
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        body: SingleChildScrollView(
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
                  height: 478,
                  child:

                      // Scrollbar(
                      //   controller: _scrollController,
                      //   isAlwaysShown: true,
                      //   radius: Radius.circular(8.0),
                      //   child:

                      ListView(
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
                              Text("Blok $i"),
                              Divider(
                                color: Colors.grey,
                                height: 2,
                              ),
                              for (var i = 0; i <= 10; i++)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Card(
                                      elevation: 2.0,
                                      color: Colors.grey[100],
                                      child: Container(
                                        width: 28,
                                        height: 28,
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
                                        width: 28,
                                        height: 28,
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
              // ),
            ],
          ),
        ));
  }
}
