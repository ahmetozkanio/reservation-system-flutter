import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/birim/model/birim_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../widgets/searchList.dart';
import '../../../widgets/snackbar.dart';
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
    BirimListController birimListController = Get.put(
      BirimListController(),
    );

    List<Widget> appBarActions = [
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
      appBar: globalAppBar(context, "Birimler", appBarActions),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (birimListController.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else {
                  return Column(
                    children: [
                      searchTextField(context, birimListController.searchBirim,
                          "Birim Ara"),
                      Expanded(
                          child: RefreshIndicator(
                        key: birimListController.refreshKey,
                        onRefresh: birimListController.refreshBirimList,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: birimListController.searchBirimList.length,
                          itemBuilder: (context, index) {
                            var cardA;
                            return ExpansionTileCard(
                              key: cardA,
                              leading: Icon(Icons.apartment),
                              title: Text(birimListController
                                  .searchBirimList[index].adi
                                  .toString()),
                              subtitle: Text(birimListController
                                  .searchBirimList[index].sehirAdi
                                  .toString()),
                              children: [
                                Divider(
                                  thickness: 1.0,
                                  height: 1.0,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8.0,
                                      ),
                                      child: Column(
                                        children: [
                                          listDetail(
                                            context,
                                            titles[0],
                                            birimListController
                                                .searchBirimList[index].sehirAdi
                                                .toString(),
                                            iconList[0],
                                          ),
                                          sizedBoxList(),
                                          listDetail(
                                            context,
                                            titles[1],
                                            birimListController
                                                .searchBirimList[index].ilceAdi
                                                .toString(),
                                            iconList[0],
                                          ),
                                          sizedBoxList(),
                                          listDetail(
                                            context,
                                            titles[2],
                                            birimListController
                                                .searchBirimList[index]
                                                .yetkiliKisi
                                                .toString(),
                                            iconList[1],
                                          ),
                                          sizedBoxList(),
                                          listDetail(
                                            context,
                                            titles[3],
                                            birimListController
                                                .searchBirimList[index].email
                                                .toString(),
                                            iconList[2],
                                          ),
                                          sizedBoxList(),
                                          listDetail(
                                            context,
                                            titles[4],
                                            birimListController
                                                .searchBirimList[index]
                                                .cepTelefon
                                                .toString(),
                                            iconList[3],
                                          ),
                                          sizedBoxList(),
                                          listDetail(
                                            context,
                                            titles[5],
                                            birimListController
                                                .searchBirimList[index]
                                                .ofisTelefon
                                                .toString(),
                                            iconList[4],
                                          )
                                        ],
                                      )),
                                ),
                                ButtonBar(
                                  alignment: MainAxisAlignment.spaceAround,
                                  buttonHeight: 32.0,
                                  buttonMinWidth: 48.0,
                                  children: [
                                    updateListTileButton(
                                        context,
                                        birimListController,
                                        birimListController
                                            .searchBirimList[index].adi!),
                                    deleteListTileButton(
                                        context,
                                        birimListController,
                                        birimListController
                                            .searchBirimList[index]),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      )),
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

  TextButton deleteListTileButton(
      context, BirimListController birimListController, Birim birim) {
    return TextButton(
      onPressed: () {
        alertDelete(context, birim, birimListController);
      },
      child: Column(
        children: [
          Icon(Icons.delete, color: Colors.red),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
          ),
          Text(
            'Sil',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }

  TextButton updateListTileButton(context, birimListController, birim) {
    return TextButton(
      // style: flatButtonStyle,
      onPressed: () {},
      child: Column(
        children: <Widget>[
          Icon(
            Icons.update_sharp,
            color: Colors.green,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
          ),
          Text(
            'Güncelle',
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }

  Future<bool?> alertDelete(
      context, Birim birim, BirimListController birimListController) {
    return Alert(
      style: AlertStyle(
          titleStyle: TextStyle(fontSize: 14),
          descStyle: TextStyle(fontSize: 12)),
      context: context,
      type: AlertType.info,
      title: birim.adi.toString(),
      desc: "Birim silinecektir onaylıyor musunuz?",
      buttons: [
        DialogButton(
          child: Text(
            "İptal",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          onPressed: () => Get.back(),
          color: Colors.grey,
        ),
        DialogButton(
          child: Text(
            "Onayla",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {
            var response = birimListController.deleteBirim(birim.id!);
            if (BirimListController.birimApiResponse) {
              birimListController.getBirimList;
              Navigator.pop(context);
              successSnackbar("Başarılı.", "Birim başarıyla silindi.");
            } else {
              errorSnackbar("Hata!", "Birim silinemedi..");
            }
          },
          color: Colors.green,
        ),
      ],
    ).show();
  }

  SizedBox sizedBoxList() {
    return SizedBox(
      height: 4.0,
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
