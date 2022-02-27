import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/widgets/form_title.dart';

import '/widgets/appbar.dart';

import '/widgets/info_list_text.dart';

import 'birim_create/birim_create_view.dart';
import 'birim_list_controller.dart';
import 'utils/default_lists.dart';

class BirimListView extends StatelessWidget {
  BirimListView({Key? key}) : super(key: key);

  EdgeInsets listP = EdgeInsets.only(right: 20, left: 72.0, bottom: 18.0);

  List<Color> colorList = [
    Color.fromARGB(255, 24, 98, 121),
  ];

  @override
  Widget build(BuildContext context) {
    final BirimListController birimListController = Get.put(
      BirimListController(),
    );

    TextField searchTextField() {
      return TextField(
        onChanged: (value) => birimListController.birimSearch(value),
        decoration: InputDecoration(
            filled: true,
            //fillColor: Color.fromARGB(255, 255, 255, 255),
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none),
            hintStyle:
                TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
            hintText: "Birim Ara"),
      );
    }

    List<Widget> appBarActions = [
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 64, top: 6, bottom: 6, right: 8),
          child: Container(
            height: 56,
            child: searchTextField(),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Get.to(() => BirimCreateView(), //next page class
              transition: Transition.rightToLeft //transition effect
              );
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

    return Scaffold(
      appBar: globalAppBar("Birimler", appBarActions),
      body: Column(
        children: [
          //formTitle("Birimler"),
          Expanded(
            child: Obx(
              () {
                if (birimListController.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else {
                  return ListView.builder(
                    itemCount: birimListController.birimList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        // color:
                        //     birimListController.birimList[index].tableColor !=
                        //             null
                        //         ? HexColor(birimListController
                        //             .birimList[index].tableBackgroundColor)
                        //         : Colors.white,
                        child: ExpansionTile(
                          title: Text(
                            birimListController.birimList[index].adi.toString(),
                            // style: TextStyle(
                            //   color: birimListController
                            //               .birimList[index].tableColor !=
                            //           null
                            //       ? HexColor(birimListController
                            //           .birimList[index].color)
                            //       : Colors.black,
                            // ),
                          ),
                          leading: const Icon(Icons.school_outlined),
                          children: [
                            listDetail(
                              titles[0],
                              birimListController.birimList[index].sehirAdi
                                  .toString(),
                              iconList[0],
                            ),
                            listDetail(
                              titles[1],
                              birimListController.birimList[index].ilceAdi
                                  .toString(),
                              iconList[0],
                            ),
                            listDetail(
                              titles[2],
                              birimListController.birimList[index].yetkiliKisi
                                  .toString(),
                              iconList[1],
                            ),
                            listDetail(
                              titles[3],
                              birimListController.birimList[index].email
                                  .toString(),
                              iconList[2],
                            ),
                            listDetail(
                              titles[4],
                              birimListController.birimList[index].cepTelefon
                                  .toString(),
                              iconList[3],
                            ),
                            listDetail(
                              titles[5],
                              birimListController.birimList[index].ofisTelefon
                                  .toString(),
                              iconList[4],
                            )
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

  // Container birimListDetail(
  //     String indexName, String title, Color color, IconData icon) {
  //   return Container(
  //     // color: Color.fromARGB(255, 214, 205, 205),
  //     padding: listP,
  //     child: Row(
  //       children: [
  //         Icon(
  //           icon,
  //           color: color,
  //         ),
  //         Text(
  //           title,
  //           style: TextStyle(
  //               color: color, fontSize: 16, fontWeight: FontWeight.bold),
  //         ),
  //         SizedBox(
  //           width: 8,
  //         ),
  //         Text(
  //           indexName,
  //           style: const TextStyle(
  //             fontSize: 14,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
