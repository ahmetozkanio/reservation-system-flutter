import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/salon/screens/salon_create_view.dart';

import '../../../widgets/appbar.dart';

import 'salon_list_controller.dart';

class SalonListView extends StatelessWidget {
  SalonListView({Key? key}) : super(key: key);

  EdgeInsets listP = EdgeInsets.only(right: 20, left: 72.0, bottom: 18.0);
  List<String> titles = [
    "Birim :",
    "Yetki :",
    "Blok Kapasite :",
    "Sandalye Kapasite :",
  ];

  List<Color> colorList = [
    Color.fromARGB(255, 24, 98, 121),
  ];

  Color color = const Color.fromARGB(255, 24, 98, 121);
  List<IconData> iconList = [
    Icons.location_city_outlined,
    Icons.person_outline_outlined,
    Icons.chair_outlined,
    Icons.table_chart_outlined
  ];

  List<Widget> appBarActions = [
    InkWell(
      onTap: () {
        Get.to(SalonCreateView(), transition: Transition.rightToLeft);
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Icon(Icons.create_outlined),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final SalonListController salonListController =
        Get.put(SalonListController());
    return Scaffold(
      appBar: globalAppBar("Salonlar", appBarActions),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (salonListController.isLoading.value)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else {
                  return ListView.builder(
                    itemCount: salonListController.salonList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ExpansionTile(
                          title: Text(
                            salonListController.salonList[index].adi.toString(),
                          ),
                          leading: const Icon(Icons.school_outlined),
                          children: [
                            birimListDetail(
                              salonListController.salonList[index].birimAdi
                                  .toString(),
                              titles[0],
                              colorList[0],
                              iconList[0],
                            ),
                            birimListDetail(
                              salonListController.salonList[index].yetki
                                  .toString(),
                              titles[1],
                              colorList[0],
                              iconList[1],
                            ),
                            birimListDetail(
                              salonListController.salonList[index].blokKapasite
                                  .toString(),
                              titles[2],
                              colorList[0],
                              iconList[3],
                            ),
                            birimListDetail(
                              salonListController
                                  .salonList[index].sandalyeKapasite
                                  .toString(),
                              titles[3],
                              colorList[0],
                              iconList[2],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Container birimListDetail(
      String indexName, String title, Color color, IconData icon) {
    return Container(
      // color: Color.fromARGB(255, 214, 205, 205),
      padding: listP,
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            title,
            style: TextStyle(
                color: color, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            indexName,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
