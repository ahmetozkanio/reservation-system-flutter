import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/fakulte/screens/fakutle_list_controller.dart';
import 'package:library_reservation_liberta_flutter/widgets/icon_widget.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/background_gradient.dart';
import '../../../widgets/searchList.dart';

class FakulteListView extends StatelessWidget {
  const FakulteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FakulteListController _fakulteListController =
        Get.put(FakulteListController());
    return Scaffold(
      appBar: globalAppBar(context, "Fakulteler", null),
      body: Container(
        decoration: pageBackgroundGradient(context),
        // color: Theme.of(context).secondaryHeaderColor,
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () {
                  if (_fakulteListController.isLoading.value)
                    return Center(child: CircularProgressIndicator());
                  else {
                    return Column(
                      children: [
                        searchTextField(
                            context,
                            _fakulteListController.searchFakulte,
                            "Fakulte Ara"),
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
                                _fakulteListController.searchFakulteList.length,
                            itemBuilder: (context, index) {
                              return ExpansionTileCard(
                                baseColor:
                                    Theme.of(context).secondaryHeaderColor,
                                initialPadding: const EdgeInsets.only(
                                  bottom: 1,
                                ),
                                elevation: 0.0,
                                leading: listTileIcon(
                                    "assets/icons/ic_university.png"),
                                title: Text(
                                  _fakulteListController
                                      .searchFakulteList[index].fakulteAdi
                                      .toString(),
                                ),
                                subtitle: Text(
                                  _fakulteListController
                                      .searchFakulteList[index].fakulteKodu
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
