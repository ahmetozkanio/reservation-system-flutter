import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/birim/screens/birim_create_view.dart';
import 'package:library_reservation_liberta_flutter/birim/screens/birim_list_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BirimListView extends StatelessWidget {
  BirimListView({Key? key}) : super(key: key);

  final BirimListController birimListController =
      Get.put(BirimListController());
  EdgeInsets listP = EdgeInsets.only(right: 20, left: 38.0, bottom: 18.0);
  List<String> titles = [
    "Şehir :",
    "İlçe :",
    "Yetkili Kişi :",
    "E-posta :",
    "Cep :",
    "Ofis :"
  ];

  List<Icon> iconList = [
    Icon(
      Icons.location_city,
    ),
  ];
  List<Color> colorList = [
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        InkWell(
          onTap: () => Get.to(BirimCreateView()),
          child: Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Icon(Icons.create_outlined),
          ),
        )
      ]),
      body: Column(
        children: [
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
                        child: ExpansionTile(
                          title: Text(
                            birimListController.birimList[index].adi.toString(),
                          ),
                          leading: const Icon(Icons.school_outlined),
                          children: [
                            birimListDetail(
                              birimListController.birimList[index].sehirAdi
                                  .toString(),
                              titles[0],
                              colorList[0],
                              iconList[0],
                            ),
                            birimListDetail(
                              birimListController.birimList[index].sehirAdi
                                  .toString(),
                              titles[1],
                              colorList[1],
                              iconList[1],
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

  Container birimListDetail(
      String indexName, String title, Color color, Icon icon) {
    return Container(
      // color: Color.fromARGB(255, 214, 205, 205),
      padding: listP,
      child: Row(
        children: [
          icon,
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


   
                              // Container(
                              //   padding: listP,
                              //   child: Row(
                              //     children: <Widget>[
                              //       Icon(
                              //         Icons.location_city,
                              //         color: Colors.red,
                              //       ),
                              //       Text(
                              //         titles[1],
                              //         style: const TextStyle(
                              //             color: Colors.red,
                              //             fontSize: 16,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //       SizedBox(
                              //         width: 8,
                              //       ),
                              //       Text(
                              //         birimListController
                              //             .birimList[index].ilceAdi
                              //             .toString(),
                              //         style: const TextStyle(
                              //           fontSize: 14,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // Container(
                              //   padding: listP,
                              //   child: Row(
                              //     children: <Widget>[
                              //       Icon(
                              //         Icons.person_outline_outlined,
                              //         color: Colors.green,
                              //       ),
                              //       Text(
                              //         titles[2],
                              //         style: const TextStyle(
                              //             color: Colors.green,
                              //             fontSize: 16,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //       SizedBox(
                              //         width: 8,
                              //       ),
                              //       Text(
                              //         birimListController
                              //             .birimList[index].yetkiliKisi
                              //             .toString(),
                              //         style: const TextStyle(
                              //           fontSize: 14,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // Container(
                              //   padding: listP,
                              //   child: Row(
                              //     children: <Widget>[
                              //       Icon(
                              //         Icons.email_outlined,
                              //         color: Colors.purple,
                              //       ),
                              //       Text(
                              //         titles[3],
                              //         style: const TextStyle(
                              //             color: Colors.purple,
                              //             fontSize: 16,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //       SizedBox(
                              //         width: 8,
                              //       ),
                              //       Text(
                              //         birimListController.birimList[index].email
                              //             .toString(),
                              //         style: const TextStyle(
                              //           fontSize: 14,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // Container(
                              //   padding: listP,
                              //   child: Row(
                              //     children: <Widget>[
                              //       Icon(
                              //         Icons.phone_android_outlined,
                              //         color: Colors.blue,
                              //       ),
                              //       Text(
                              //         titles[4],
                              //         style: const TextStyle(
                              //             color: Colors.blue,
                              //             fontSize: 16,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //       SizedBox(
                              //         width: 8,
                              //       ),
                              //       Text(
                              //         birimListController
                              //             .birimList[index].cepTelefon
                              //             .toString(),
                              //         style: const TextStyle(
                              //           fontSize: 14,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // Container(
                              //   padding: listP,
                              //   child: Row(
                              //     children: <Widget>[
                              //       Icon(
                              //         Icons.phone_enabled_outlined,
                              //         color: Colors.purple,
                              //       ),
                              //       Text(
                              //         titles[5],
                              //         style: const TextStyle(
                              //             color: Colors.purple,
                              //             fontSize: 16,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //       SizedBox(
                              //         width: 8,
                              //       ),
                              //       Text(
                              //         birimListController
                              //             .birimList[index].ofisTelefon
                              //             .toString(),
                              //         style: const TextStyle(
                              //           fontSize: 14,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),