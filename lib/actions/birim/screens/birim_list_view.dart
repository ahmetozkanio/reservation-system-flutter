import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/searchList.dart';
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

    // This function is called whenever the text field changes
    // void search(String enteredKeyword) {
    //   List<Map<String, dynamic>> results = [];
    //   if (enteredKeyword.isEmpty) {
    //     // if the search field is empty or only contains white-space, we'll display all users
    //     results = birimListController.birimList.cast<Map<String, dynamic>>();
    //   } else {
    //     birimListController.searchBirimList = birimListController.birimList
    //         .where((user) =>
    //             user.adi!.toLowerCase().contains(enteredKeyword.toLowerCase()))
    //         .toList();
    //     // we use the toLowerCase() method to make it case-insensitive
    //   }

    //   // Refresh the UI

    //   birimListController.searchBirimList = results.cast<Birim>();
    // }

    // search(String value) {
    //   if (value.isNotEmpty) {
    //     birimListController.searchBirimList = birimListController.birimList
    //         .where((birim) => birim.adi!.toLowerCase().contains(value))
    //         .toList();
    //   } else {}
    // }

    // TextField searchTextField(Function search) {
    //   return TextField(
    //     onChanged: (value) => controller.searchBirim(value),
    //     decoration: InputDecoration(
    //         filled: true,
    //         fillColor: Color.fromARGB(255, 255, 255, 255),
    //         contentPadding: EdgeInsets.all(0),
    //         prefixIcon: Icon(
    //           Icons.search,
    //           color: Color.fromARGB(255, 0, 0, 0),
    //         ),
    //         border: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(50),
    //             borderSide: BorderSide.none),
    //         hintStyle:
    //             TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
    //         hintText: "Birim Ara"),
    //   );
    // }

    List<Widget> appBarActions = [
      // AnimSearchBar(
      //   color: Colors.blue,
      //   helpText: "Birim Ara",
      //   width: 250,
      //   textController: birimListController.searchTextCtrl,
      //   onSuffixTap: () {
      //     birimListController.searchTextCtrl.clear();
      //   },
      // ),
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
          //formTitle("Birimler")sd,
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
                          child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: birimListController.searchBirimList.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title: Text(
                              birimListController.searchBirimList[index].adi
                                  .toString(),
                            ),
                            leading: const Icon(Icons.school_outlined),
                            children: [
                              listDetail(
                                context,
                                titles[0],
                                birimListController
                                    .searchBirimList[index].sehirAdi
                                    .toString(),
                                iconList[0],
                              ),
                              listDetail(
                                context,
                                titles[1],
                                birimListController
                                    .searchBirimList[index].ilceAdi
                                    .toString(),
                                iconList[0],
                              ),
                              listDetail(
                                context,
                                titles[2],
                                birimListController
                                    .searchBirimList[index].yetkiliKisi
                                    .toString(),
                                iconList[1],
                              ),
                              listDetail(
                                context,
                                titles[3],
                                birimListController.searchBirimList[index].email
                                    .toString(),
                                iconList[2],
                              ),
                              listDetail(
                                context,
                                titles[4],
                                birimListController
                                    .searchBirimList[index].cepTelefon
                                    .toString(),
                                iconList[3],
                              ),
                              listDetail(
                                context,
                                titles[5],
                                birimListController
                                    .searchBirimList[index].ofisTelefon
                                    .toString(),
                                iconList[4],
                              )
                            ],
                          );
                        },
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
