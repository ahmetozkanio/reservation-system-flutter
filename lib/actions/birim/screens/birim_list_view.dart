import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'birim_create_view.dart';
import 'birim_list_controller.dart';

class BirimListView extends StatelessWidget {
  BirimListView({Key? key}) : super(key: key);

  final BirimListController birimListController =
      Get.put(BirimListController());
  EdgeInsets listP = EdgeInsets.only(right: 20, left: 72.0, bottom: 18.0);
  List<String> titles = [
    "Şehir :",
    "İlçe :",
    "Yetkili Kişi :",
    "E-posta :",
    "Cep :",
    "Ofis :"
  ];

  List<Color> colorList = [
    Color.fromARGB(255, 24, 98, 121),
  ];

  Color color = const Color.fromARGB(255, 24, 98, 121);
  List<IconData> iconList = [
    Icons.location_city,
    Icons.person_outline_outlined,
    Icons.email_outlined,
    Icons.phone_android_outlined,
    Icons.phone_enabled_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        actions: [
          InkWell(
            onTap: () => Get.to(BirimCreateView()),
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Icon(Icons.create_outlined),
            ),
          ),
        ],
      ),
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
                              birimListController.birimList[index].ilceAdi
                                  .toString(),
                              titles[1],
                              colorList[0],
                              iconList[0],
                            ),
                            birimListDetail(
                              birimListController.birimList[index].yetkiliKisi
                                  .toString(),
                              titles[2],
                              colorList[0],
                              iconList[1],
                            ),
                            birimListDetail(
                              birimListController.birimList[index].email
                                  .toString(),
                              titles[3],
                              colorList[0],
                              iconList[2],
                            ),
                            birimListDetail(
                              birimListController.birimList[index].cepTelefon
                                  .toString(),
                              titles[4],
                              colorList[0],
                              iconList[3],
                            ),
                            birimListDetail(
                              birimListController.birimList[index].ofisTelefon
                                  .toString(),
                              titles[5],
                              colorList[0],
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
