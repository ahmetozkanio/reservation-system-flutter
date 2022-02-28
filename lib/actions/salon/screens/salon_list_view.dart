import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/widgets/searchList.dart';

import '/widgets/appbar.dart';

import 'salon_create/salon_create_view.dart';
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
                  return Column(
                    children: [
                      searchTextField(
                          salonListController.searchSalon, "Salon Ara"),
                      Expanded(
                        child: ListView.builder(
                          itemCount: salonListController.searchSalonList.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              // Specify a key if the Slidable is dismissible.
                              key: ValueKey(0),

                              // The start action pane is the one at the left or the top side.
                              startActionPane: ActionPane(
                                // A motion is a widget used to control how the pane animates.
                                motion: ScrollMotion(),

                                // A pane can dismiss the Slidable.
                                dismissible:
                                    DismissiblePane(onDismissed: () {}),

                                // All actions are defined in the children parameter.
                                children: [
                                  // A SlidableAction can have an icon and/or a label.
                                  SlidableAction(
                                    onPressed: doNothing,
                                    backgroundColor: Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                  SlidableAction(
                                    onPressed: doNothing,
                                    backgroundColor: Color(0xFF21B7CA),
                                    foregroundColor: Colors.white,
                                    icon: Icons.share,
                                    label: 'Share',
                                  ),
                                ],
                              ),

                              // The end action pane is the one at the right or the bottom side.
                              endActionPane: ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    // An action can be bigger than the others.
                                    flex: 2,
                                    onPressed: doNothing,
                                    backgroundColor: Color(0xFF7BC043),
                                    foregroundColor: Colors.white,
                                    icon: Icons.archive,
                                    label: 'Archive',
                                  ),
                                  SlidableAction(
                                    onPressed: doNothing,
                                    backgroundColor: Color(0xFF0392CF),
                                    foregroundColor: Colors.white,
                                    icon: Icons.save,
                                    label: 'Save',
                                  ),
                                ],
                              ),

                              // The child of the Slidable is what the user sees when the
                              // component is not dragged.
                              child: ExpansionTile(
                                title: Text(
                                  salonListController.searchSalonList[index].adi
                                      .toString(),
                                ),
                                leading: const Icon(Icons.school_outlined),
                                children: [
                                  birimListDetail(
                                    salonListController
                                        .searchSalonList[index].birimAdi
                                        .toString(),
                                    titles[0],
                                    colorList[0],
                                    iconList[0],
                                  ),
                                  birimListDetail(
                                    salonListController
                                        .searchSalonList[index].yetki
                                        .toString(),
                                    titles[1],
                                    colorList[0],
                                    iconList[1],
                                  ),
                                  birimListDetail(
                                    salonListController
                                        .searchSalonList[index].blokKapasite
                                        .toString(),
                                    titles[2],
                                    colorList[0],
                                    iconList[3],
                                  ),
                                  birimListDetail(
                                    salonListController
                                        .searchSalonList[index].sandalyeKapasite
                                        .toString(),
                                    titles[3],
                                    colorList[0],
                                    iconList[2],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void doNothing(BuildContext context) {}
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
