import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/appbar.dart';
import '../../../../widgets/icon_widget.dart';
import '../../../../widgets/searchList.dart';
import 'kurum_list_controller.dart';

class KurumListView extends StatelessWidget {
  const KurumListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KurumListController _kurumListController = Get.put(KurumListController());

    List<Widget> appBarActions = [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.create_rounded,
          ))
    ];

    return Scaffold(
      appBar: globalAppBar(
        context,
        "Kurumlar",
        appBarActions,
      ),
      body: Container(
        // decoration: pageBackgroundGradient(context),
        // color: Theme.of(context).secondaryHeaderColor,
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () {
                  if (_kurumListController.isLoading.value)
                    return Center(child: CircularProgressIndicator());
                  else {
                    return Column(
                      children: [
                        searchTextField(context,
                            _kurumListController.searchKurum, "Kurum Ara"),
                        SizedBox(
                          height: 8.0,
                        ),
                        Expanded(
                          child: ListView.builder(
                            // padding: EdgeInsets.only(bottom: 5),
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            shrinkWrap: true,
                            itemCount:
                                _kurumListController.searchKurumList.length,
                            itemBuilder: (context, index) {
                              return ExpansionTileCard(
                                baseColor: Theme.of(context).cardColor,
                                initialPadding: const EdgeInsets.only(
                                  bottom: 1,
                                ),
                                elevation: 0.0,
                                leading: listTileIcon(
                                    "assets/icons/ic_university.png"),
                                title: Text(
                                  _kurumListController
                                      .searchKurumList[index].kurumAdi
                                      .toString(),
                                ),
                                subtitle: Text(
                                  _kurumListController
                                      .searchKurumList[index].kurumUnvan
                                      .toString(),
                                ),
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
                                            // listDetail(
                                            //   context,
                                            //   kurumDetailTitle[5],
                                            //   _kurumListController
                                            //       .searchKurumList[index]
                                            //       .kurumAdi
                                            //       .toString(),
                                            //   kurumDetailIconList[4],
                                            // )
                                          ],
                                        )),
                                  ),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.spaceAround,
                                    buttonHeight: 32.0,
                                    buttonMinWidth: 48.0,
                                    children: [
                                      // updateListTileButton(
                                      //     context,
                                      //     birimListController,
                                      //     birimListController
                                      //         .searchBirimList[index]),
                                      // deleteListTileButton(
                                      //     context,
                                      //     birimListController,
                                      //     birimListController
                                      //         .searchBirimList[index]),
                                    ],
                                  ),
                                ],
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
      ),
    );
  }
}
