import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:library_reservation_liberta_flutter/actions/admin/salon/model/salon_model.dart';
import 'package:library_reservation_liberta_flutter/actions/rezervasyon/screens/reservation_view_controller.dart';
import 'package:library_reservation_liberta_flutter/widgets/appbar.dart';
import '../../../functions/date_time_format.dart';
import '../../../widgets/date_picker_theme.dart';

class ReservationView extends StatelessWidget {
  const ReservationView(this._salonModel, {Key? key}) : super(key: key);

  final SalonModel _salonModel;

  @override
  Widget build(BuildContext context) {
    ReservationViewController _reservationViewController = Get.put(
      ReservationViewController(),
    );
    _reservationViewController.salonModel =
        _salonModel; // ilgili salonu aliyoruz.

    return Scaffold(
        appBar: globalAppBar(context, "Rezervasyon", null),
        body: SafeArea(
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              // SliverPadding(
              //   padding: const EdgeInsets.all(
              //     12.0,
              //   ),
              //   sliver: SliverToBoxAdapter(
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "REZERVASYON",
              //           style: TextStyle(
              //               fontSize: Theme.of(context)
              //                   .textTheme
              //                   .titleLarge!
              //                   .fontSize),
              //         ),
              //         // Text("Salonlar")
              //       ],
              //     ),
              //   ),
              // ),
              SliverPadding(
                padding: EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  bottom: 12.0,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tarih Ve Saat",
                      ),
                      SizedBox(
                        height: 14.0,
                      ),
                      Container(
                        height: 32,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Obx(() => OutlinedButton(
                                  //Baslangic Tarihi butonu
                                  onPressed: () {
                                    DatePicker.showDatePicker(
                                      context,
                                      theme: customDatePickerTheme(context),
                                      showTitleActions: true,
                                      minTime: DateTime
                                          .now(), //suanki zaman ile baslatiliyor.
                                      maxTime: DateTime(2050, 12, 31),
                                      onChanged: (date) {},
                                      onConfirm: (date) {
                                        _reservationViewController
                                                .rezervasyonMinBitisTarihiAndBaslangicCurrentDate
                                                .value =
                                            date; //Bitis Tarihi butonu tetikleniyor ve min zaman dilimi ayarlaniyor.
                                        _reservationViewController
                                                .rezervasyonBaslangicTarihi
                                                .value =
                                            dateFormat(
                                                date); //Salon Baslangic tarihi formatlanip deger aliniyor. 2022-05-18
                                      },
                                      currentTime: _reservationViewController
                                          .rezervasyonMinBitisTarihiAndBaslangicCurrentDate
                                          .value, //Secili olan tarih.
                                      locale: LocaleType.tr,
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.date_range,
                                        size: 16.0,
                                      ),
                                      Text(
                                        'Başlangıç Tarihi : ' +
                                            _reservationViewController
                                                .rezervasyonBaslangicTarihi
                                                .value
                                                .toString(),
                                        style: TextStyle(fontSize: 11.0),
                                      ),
                                    ],
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.0)),
                            Obx(() => OutlinedButton(
                                  //BitisTarihi Butonu
                                  onPressed: () {
                                    DatePicker.showDatePicker(
                                      context,
                                      theme: customDatePickerTheme(context),
                                      showTitleActions: true,
                                      minTime: _reservationViewController
                                          .rezervasyonMinBitisTarihiAndBaslangicCurrentDate
                                          .value,
                                      maxTime: DateTime(2050, 12, 31),
                                      onChanged: (date) {},
                                      onConfirm: (date) {
                                        _reservationViewController
                                                .rezervasyonBitisTarihiCurrentDate
                                                .value =
                                            date; //Bitis tarihi secilmis olan tarih.
                                        _reservationViewController
                                                .rezervasyonBitisTarihi.value =
                                            dateFormat(
                                                date); // Tarihi formatlanip  String deger aliniyor. 2022-05-18
                                      },
                                      currentTime: _reservationViewController
                                          .rezervasyonBitisTarihiCurrentDate
                                          .value, //secili olan tarih
                                      locale: LocaleType.tr,
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.date_range,
                                        size: 16.0,
                                      ),
                                      Text(
                                        'Bitiş Tarihi : ' +
                                            _reservationViewController
                                                .rezervasyonBitisTarihi.value,
                                        style: TextStyle(fontSize: 11.0),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        height: 32,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Obx(
                              () => OutlinedButton(
                                //Baslangic saati
                                onPressed: () {
                                  DatePicker.showTimePicker(context,
                                      showTitleActions: true,
                                      theme: customDatePickerTheme(context),
                                      // minTime: DateTime.now(),
                                      // maxTime: DateTime(2022, 12, 31),
                                      showSecondsColumn: false,
                                      onChanged: (date) {}, onConfirm: (date) {
                                    _reservationViewController
                                            .rezervasyonMinBitisSaatiAndBaslangicCurrentTime
                                            .value =
                                        date; //secilen saat degeri esitleniyor.
                                    _reservationViewController
                                            .rezervasyonBaslangicSaati.value =
                                        timeFormat(
                                            date); //String saat degerimiz.
                                  },
                                      currentTime: _reservationViewController
                                          .rezervasyonMinBitisSaatiAndBaslangicCurrentTime
                                          .value,
                                      locale: LocaleType.tr);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.schedule,
                                      size: 16.0,
                                    ),
                                    Text(
                                      'Başlangıç Saati : ' +
                                          _reservationViewController
                                              .rezervasyonBaslangicSaati.value,
                                      style: TextStyle(fontSize: 11.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.0)),
                            Obx(() => OutlinedButton(
                                  //bitis saati
                                  onPressed: () {
                                    DatePicker.showTimePicker(context,
                                        showTitleActions: true,
                                        showSecondsColumn: false,
                                        theme: customDatePickerTheme(context),
                                        onChanged: (date) {},
                                        onConfirm: (date) {
                                      _reservationViewController
                                              .rezervasyonBitisTarihiCurrentDate
                                              .value =
                                          date; //Bitis saati secili deger tekrar gozukmesi icin gerekli.
                                      _reservationViewController
                                              .rezervasyonBitisSaati.value =
                                          timeFormat(
                                              date); //String saat degerimiz.
                                    },
                                        currentTime: _reservationViewController
                                                    .rezervasyonBitisTarihiCurrentDate
                                                    .value ==
                                                DateTime.now()
                                            ? _reservationViewController
                                                .rezervasyonMinBitisSaatiAndBaslangicCurrentTime
                                                .value // herhangi bir bitis saati secilmemis ise baslangic saatin secili degeri gelir.
                                            : _reservationViewController
                                                .rezervasyonBitisTarihiCurrentDate
                                                .value, // bitis saati secilmis ise bitis saatinin degeri secili gelir.
                                        locale: LocaleType.tr);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.schedule,
                                        size: 16.0,
                                      ),
                                      Text(
                                        'Bitiş Saati : ' +
                                            _reservationViewController
                                                .rezervasyonBitisSaati.value,
                                        style: TextStyle(fontSize: 11.0),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search),
                            SizedBox(
                              width: 12.0,
                            ),
                            Text('Rezervasyon Ara'),
                          ],
                        ),
                        onPressed: () {
                          _reservationViewController.fetchReservation(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Card(
              //   elevation: 4.0,
              //   child: Container(
              //     alignment: Alignment.topLeft,
              //     constraints: BoxConstraints(
              //       maxHeight: MediaQuery.of(context).size.height * 0.50,
              //     ),
              //     child: CrossScroll(
              //       ///Optional
              //       // normalColor: Colors.blue,
              //       ///Optional
              //       // hoverColor: Colors.red,
              //       ///Optional
              //       // dimColor: Colors.red.withOpacity(0.4),
              //       ///design track and thumb
              //       // verticalBar: const CrossScrollBar(),
              //       // horizontalBar: const CrossScrollBar(),

              //       child: Row(
              //         children: [
              //           for (int i = 0; i < 20; i++)
              //             Container(
              //                 width: 85.0,
              //                 padding: EdgeInsets.all(12.0),
              //                 // decoration: BoxDecoration(),
              //                 child: Column(children: [
              //                   Text("Blok $i"),
              //                   GridView.builder(
              //                     physics: NeverScrollableScrollPhysics(),
              //                     shrinkWrap: true,
              //                     padding: EdgeInsets.zero,
              //                     gridDelegate:
              //                         SliverGridDelegateWithFixedCrossAxisCount(
              //                       crossAxisCount: 2,
              //                       crossAxisSpacing: 2,
              //                       mainAxisSpacing: 2,
              //                       childAspectRatio: 1,
              //                     ),
              //                     itemCount: 30,
              //                     itemBuilder: (context, index) {
              //                       return Obx(
              //                         () => GFRadio(
              //                           type: GFRadioType.custom,
              //                           size: 25,
              //                           value: index,
              //                           // toggleable: true,
              //                           inactiveBgColor:
              //                               Color.fromARGB(255, 184, 33, 33),
              //                           groupValue: reservationViewController
              //                               .groupValue.value,
              //                           onChanged: (value) {
              //                             print(value.toString());
              //                             i == 5
              //                                 ? reservationViewController
              //                                     .groupValue
              //                                     .value = value as int
              //                                 : null;
              //                           },
              //                           inactiveIcon: null,
              //                           activeBorderColor: GFColors.SUCCESS,
              //                           customBgColor: GFColors.SUCCESS,
              //                         ),
              //                       );
              //                     },
              //                     // children: [
              //                     //   for (int i = 1; i < 55; i++)

              //                     // Card(
              //                     //   color: Color.fromARGB(255, 209, 36, 36),
              //                     //   child: Container(
              //                     //     width: 18,
              //                     //     height: 18,
              //                     //     alignment: Alignment.center,
              //                     //     child: Text(
              //                     //       "",
              //                     //       style: TextStyle(
              //                     //         color: Colors.white,
              //                     //       ),
              //                     //       textAlign: TextAlign.center,
              //                     //     ),
              //                     //   ),
              //                     // ),
              //                     // ],
              //                   ),
              //                 ]))
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Card(
              //   child: Column(
              //     children: [
              //       Container(
              //         width: 200,
              //         child: Text("Reservasyon "),
              //       ),
              //       Obx(() => Container(
              //             child: GFCheckboxListTile(
              //               type: GFCheckboxType.circle,
              //               title: Text("Rasgele rezervasyon yap"),
              //               subTitle: Text(
              //                 "Sandalyenizi otomatik seçer",
              //                 style: TextStyle(fontSize: 10.0),
              //               ),
              //               size: GFSize.SMALL,
              //               activeBgColor: GFColors.SUCCESS,
              //               onChanged: (value) {
              //                 reservationViewController.isChecked.value = value;
              //               },
              //               value: reservationViewController.isChecked.value,
              //             ),
              //           )),
              //       TextButton(
              //           onPressed: () {
              //             DatePicker.showPicker(context, showTitleActions: true,
              //                 onChanged: (date) {
              //               print('change $date in time zone ' +
              //                   date.timeZoneOffset.inHours.toString());
              //             }, onConfirm: (date) {
              //               print('confirm $date');
              //             },
              //                 pickerModel:
              //                     DateTimePicker(currentTime: DateTime.now()),
              //                 locale: LocaleType.tr);
              //           },
              //           child: Text(
              //             'show custom time picker,\nyou can custom picker model like this',
              //             style: TextStyle(color: Colors.blue),
              //           )),
              //       TextButton(
              //         onPressed: () {
              //           DatePicker.showTimePicker(
              //             context,
              //             showTitleActions: true,
              //             onChanged: (date) {
              //               print('change $date in time zone ' +
              //                   date.timeZoneOffset.inHours.toString());
              //             },
              //             onConfirm: (date) {
              //               print('confirm $date');
              //             },
              //             currentTime: DateTime.now().toLocal(),
              //             locale: LocaleType.tr,
              //           );
              //         },
              //         child: Text(
              //           'Saat Sec',
              //           style: TextStyle(
              //             color: Colors.blue,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SliverPadding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  top: 48.0,
                ),
                sliver: Obx(
                  () => _reservationViewController.reservationAramaLoading.value
                      ? SliverToBoxAdapter(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 38.0,
                                  color: Theme.of(context)
                                      .buttonTheme
                                      .colorScheme
                                      ?.primary,
                                ),
                                Container(
                                  child: Text(
                                    "Rezervasyonları listelemek icin arama yapiniz.",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .buttonTheme
                                            .colorScheme
                                            ?.primary,
                                        fontSize: 14.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Obx(
                          () => _reservationViewController
                                  .reservationListLoading.value
                              ? SliverToBoxAdapter(
                                  child: Text(
                                      'Rezervasyon shimmer api donene kadar'))
                              : SliverToBoxAdapter(
                                  child: Card(
                                      elevation: 8.0,
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        constraints: BoxConstraints(
                                          maxHeight: _reservationViewController
                                              .blokSandalyeAdetiUiMaxHeight
                                              .value,
                                        ),
                                        child: CrossScroll(
                                          ///Optional
                                          // normalColor: Colors.blue,
                                          ///Optional
                                          // hoverColor: Colors.red,
                                          ///Optional
                                          // dimColor: Colors.red.withOpacity(0.4),
                                          ///design track and thumb
                                          // verticalBar: const CrossScrollBar(),
                                          // horizontalBar: const CrossScrollBar(),

                                          child: Row(
                                            children: [
                                              if (_reservationViewController
                                                      .reservationList !=
                                                  null)
                                                for (var blokList
                                                    in _reservationViewController
                                                        .reservationList)
                                                  Container(
                                                      width: 112.0,
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      // decoration: BoxDecoration(),
                                                      child: Column(children: [
                                                        Text(blokList.adi
                                                            .toString()),
                                                        blokList.masayaAitSandalyeler !=
                                                                null
                                                            ? GridView.builder(
                                                                physics:
                                                                    NeverScrollableScrollPhysics(),
                                                                shrinkWrap:
                                                                    true,
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                gridDelegate:
                                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      0.0,
                                                                  mainAxisSpacing:
                                                                      0.0,
                                                                  childAspectRatio:
                                                                      1.0,
                                                                ),
                                                                itemCount: blokList
                                                                        .masayaAitSandalyeler
                                                                        ?.length ??
                                                                    0,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return blokList
                                                                              .masayaAitSandalyeler![index]
                                                                              .sandalyeId !=
                                                                          null
                                                                      ? Obx(
                                                                          () =>
                                                                              Card(
                                                                            elevation:
                                                                                3.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                            ),
                                                                            child: GFRadio<String>(
                                                                                type: GFRadioType.custom,
                                                                                size: 25.0,
                                                                                value: blokList.masayaAitSandalyeler![index].sandalyeId!,
                                                                                toggleable: true,
                                                                                inactiveBgColor: blokList.masayaAitSandalyeler![index].sandalyeDoluMu! ? GFColors.DANGER : Color.fromARGB(255, 235, 235, 235),
                                                                                groupValue: _reservationViewController.groupValue.value,
                                                                                onChanged: (value) {
                                                                                  print('Basilan Sandalye Id miz. : ' + value);
                                                                                  blokList.masayaAitSandalyeler![index].sandalyeDoluMu! ? _reservationViewController.groupValue.value = value : null; // Sandalye doluysa groupValue degerimiz degistirmemis olacagiz ve kullanici dolu sandalyeyi secememis olacaktir. Aslinda Radio butonu disabled etmis gibi oluyoruz.
                                                                                  print('Secili Group value degerimiz. : ' + _reservationViewController.groupValue.value);
                                                                                },
                                                                                activeIcon: Icon(
                                                                                  Icons.done,
                                                                                  color: GFColors.SUCCESS,
                                                                                ),
                                                                                inactiveIcon: null,
                                                                                activeBorderColor: GFColors.SUCCESS,
                                                                                inactiveBorderColor: blokList.masayaAitSandalyeler![index].sandalyeDoluMu! ? GFColors.DANGER : GFColors.SUCCESS

                                                                                // customBgColor:
                                                                                //     GFColors.SUCCESS,
                                                                                ),
                                                                          ),
                                                                        )
                                                                      : Text('');
                                                                },
                                                                // children: [
                                                                //   for (int i = 1; i < 55; i++)

                                                                // Card(
                                                                //   color: Color.fromARGB(255, 209, 36, 36),
                                                                //   child: Container(
                                                                //     width: 18,
                                                                //     height: 18,
                                                                //     alignment: Alignment.center,
                                                                //     child: Text(
                                                                //       "",
                                                                //       style: TextStyle(
                                                                //         color: Colors.white,
                                                                //       ),
                                                                //       textAlign: TextAlign.center,
                                                                //     ),
                                                                //   ),
                                                                // ),
                                                                // ],
                                                              )
                                                            : Text(''),
                                                      ]))
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                        ),
                ),
              ),

              const SliverPadding(padding: EdgeInsets.only(bottom: 64.0))
            ],
          ),
        ));
  }
}

// Widget reservationSingleSelectButton(
//   var index,
// ) {
//   return OutlinedButton(onPressed: () {}, child: Text("$index"));
// }


















  // Column(
            //   children: [
            //     for (var i = 1; i < 70; i++)
            //       Row(
            //         children: [
            //           for (var i = 1; i < 50; i++)
            //             Container(
            //                 margin: const EdgeInsets.all(2),
            //                 width: 18,
            //                 height: 18,

            //                 ///get random color for container
            //                 color: Color.fromARGB(255, random.nextInt(255),
            //                     random.nextInt(255), random.nextInt(255))),
            //         ],
            //       )
            //   ],
            // ),


          //   CustomScrollView(
          //     slivers: [
          //       SliverToBoxAdapter(),
          //       SliverList(
          //           delegate: SliverChildListDelegate(
          //         [
          //           // Card(
          //           //   elevation: 3.0,
          //           //   child: Container(
          //           //     height: MediaQuery.of(context).size.height / 2,
          //           //     child: Expanded(
          //           //       child: ListView(
          //           //         shrinkWrap: true,
          //           //         padding: EdgeInsets.symmetric(vertical: 12.0),
          //           //         scrollDirection: Axis.horizontal,
          //           //         children: [
          //           //           for (int i = 0; i < 10; i++)
          //           //             Container(
          //           //               width: 85.0,
          //           //               padding: EdgeInsets.all(12.0),
          //           //               // decoration: BoxDecoration(),
          //           //               child: Column(
          //           //                 children: [
          //           //                   Text("Blok $i"),
          //           //                   Container(
          //           //                     height:
          //           //                         MediaQuery.of(context).size.height /
          //           //                                 3 +
          //           //                             48,
          //           //                     child: GridView(
          //           //                       // physics: NeverScrollableScrollPhysics(),
          //           //                       shrinkWrap: true,
          //           //                       padding: EdgeInsets.zero,
          //           //                       gridDelegate:
          //           //                           SliverGridDelegateWithFixedCrossAxisCount(
          //           //                         crossAxisCount: 2,
          //           //                         crossAxisSpacing: 0,
          //           //                         mainAxisSpacing: 0,
          //           //                         childAspectRatio: 1,
          //           //                       ),
          //           //                       scrollDirection: Axis.vertical,
          //           //                       children: [
          //           //                         for (int i = 0; i < 40; i++)
          //           //                           Card(
          //           //                             color: Color.fromARGB(
          //           //                                 255, 209, 36, 36),
          //           //                             child: Container(
          //           //                               width: 18,
          //           //                               height: 18,
          //           //                               alignment: Alignment.center,
          //           //                               child: Text(
          //           //                                 "$i",
          //           //                                 style: TextStyle(
          //           //                                   color: Colors.white,
          //           //                                 ),
          //           //                                 textAlign: TextAlign.center,
          //           //                               ),
          //           //                             ),
          //           //                           ),
          //           //                       ],
          //           //                     ),
          //           //                   ),
          //           //                 ],
          //           //               ),
          //           //             ),
          //           //         ],
          //           //       ),
          //           //     ),
          //           //   ),
          //           // ),

          //           // Card(
          //           //   child: Column(
          //           //     children: [
          //           //       Container(
          //           //         width: 200,
          //           //         child: Text("Reservasyon "),
          //           //       ),
          //           //       Obx(() => Container(
          //           //             child: GFCheckboxListTile(
          //           //               type: GFCheckboxType.circle,
          //           //               title: Text("Rasgele rezervasyon yap"),
          //           //               subTitle: Text(
          //           //                 "Sandalyenizi otomatik seçer",
          //           //                 style: TextStyle(fontSize: 10.0),
          //           //               ),
          //           //               size: GFSize.SMALL,
          //           //               activeBgColor: GFColors.SUCCESS,
          //           //               onChanged: (value) {
          //           //                 reservationViewController.isChecked.value =
          //           //                     value;
          //           //               },
          //           //               value:
          //           //                   reservationViewController.isChecked.value,
          //           //             ),
          //           //           )),
          //           //       TextButton(
          //           //           onPressed: () {
          //           //             DatePicker.showPicker(context,
          //           //                 showTitleActions: true, onChanged: (date) {
          //           //               print('change $date in time zone ' +
          //           //                   date.timeZoneOffset.inHours.toString());
          //           //             }, onConfirm: (date) {
          //           //               print('confirm $date');
          //           //             },
          //           //                 pickerModel: DateTimePicker(
          //           //                     currentTime: DateTime.now()),
          //           //                 locale: LocaleType.tr);
          //           //           },
          //           //           child: Text(
          //           //             'show custom time picker,\nyou can custom picker model like this',
          //           //             style: TextStyle(color: Colors.blue),
          //           //           )),
          //           //       TextButton(
          //           //         onPressed: () {
          //           //           DatePicker.showTimePicker(
          //           //             context,
          //           //             showTitleActions: true,
          //           //             onChanged: (date) {
          //           //               print('change $date in time zone ' +
          //           //                   date.timeZoneOffset.inHours.toString());
          //           //             },
          //           //             onConfirm: (date) {
          //           //               print('confirm $date');
          //           //             },
          //           //             currentTime: DateTime.now().toLocal(),
          //           //             locale: LocaleType.tr,
          //           //           );
          //           //         },
          //           //         child: Text(
          //           //           'Saat Sec',
          //           //           style: TextStyle(
          //           //             color: Colors.blue,
          //           //           ),
          //           //         ),
          //           //       ),
          //           //     ],
          //           //   ),
          //           // ),
          //         ],
          //       )),
          //     ],
          //   ),
          // )

          // //  SafeArea(
          // //   child: Column(
          // //     mainAxisSize: MainAxisSize.max,
          // //     children: [
          // //       // Text(
          // //       //   "Salon ",
          // //       //   style: TextStyle(
          // //       //       fontSize: Theme.of(context).textTheme.titleLarge!.fontSize),
          // //       //   textAlign: TextAlign.center,
          // //       // ),
          // //       Card(
          // //         elevation: 3.0,
          // //         child:
          // //             // Container(
          // //             //   padding: EdgeInsets.only(
          // //             //     top: 12.0,
          // //             //     bottom: 12.0,
          // //             //   ),
          // //             //   height: 500,
          // //             //   child:
          // //             Scrollbar(
          // //           //  isAlwaysShown: true,
          // //           showTrackOnHover: true,
          // //           thickness: 7,
          // //           radius: Radius.circular(20),
          // //           interactive: true,
          // //           child: ListView(
          // //             padding: EdgeInsets.all(12.0),
          // //             shrinkWrap: true,
          // //             // padding: EdgeInsets.all(12.0),
          // //             scrollDirection: Axis.horizontal,
          // //             children: [
          // //               Container(
          // //                 width: 200,
          // //                 child: GridView(
          // //                   padding: EdgeInsets.zero,
          // //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // //                     crossAxisCount: 2,
          // //                     crossAxisSpacing: 10,
          // //                     mainAxisSpacing: 10,
          // //                     childAspectRatio: 1,
          // //                   ),
          // //                   scrollDirection: Axis.vertical,
          // //                   children: [
          // //                     Container(width: 12, height: 12, color: Colors.red),
          // //                     Container(width: 12, height: 12, color: Colors.red),
          // //                     Container(width: 12, height: 12, color: Colors.red),
          // //                   ],
          // //                 ),
          // //               ),
          // //               Container(
          // //                 width: 200,
          // //                 child: GridView(
          // //                   padding: EdgeInsets.zero,
          // //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // //                     crossAxisCount: 2,
          // //                     crossAxisSpacing: 10,
          // //                     mainAxisSpacing: 10,
          // //                     childAspectRatio: 1,
          // //                   ),
          // //                   scrollDirection: Axis.vertical,
          // //                   children: [
          // //                     Container(width: 12, height: 12, color: Colors.red),
          // //                     Container(width: 12, height: 12, color: Colors.red),
          // //                     Container(width: 12, height: 12, color: Colors.red),
          // //                   ],
          // //                 ),
          // //               ),
          // //               // for (var i = 0; i <= 10; i++)
          // //               //   Padding(
          // //               //     padding: EdgeInsets.all(8.0),
          // //               //     child: Column(
          // //               //       mainAxisSize: MainAxisSize.max,
          // //               //       children: [
          // //               //         Text("Blok "),
          // //               //         Divider(
          // //               //           color: Colors.grey,
          // //               //           height: 2,
          // //               //         ),
          // //               //         for (var i = 0; i <= 10; i++)
          // //               //           Row(
          // //               //             mainAxisSize: MainAxisSize.max,
          // //               //             children: [
          // //               //               GestureDetector(
          // //               //                 onTap: () {
          // //               //                   reservationViewController
          // //               //                       .selectedIndex.value = i;
          // //               //                 },
          // //               //                 child: Card(
          // //               //                   // elevation: 2.0,
          // //               //                   color: reservationViewController
          // //               //                               .selectedIndex.value ==
          // //               //                           1
          // //               //                       ? reservationViewController
          // //               //                           .selectedIndexColor
          // //               //                       : reservationViewController
          // //               //                           .disabledIndexColor,
          // //               //                   child: Container(
          // //               //                     width: 24,
          // //               //                     height: 24,
          // //               //                     alignment: Alignment.center,
          // //               //                     child: Text(
          // //               //                       "$i",
          // //               //                       textAlign: TextAlign.center,
          // //               //                     ),
          // //               //                   ),
          // //               //                 ),
          // //               //               ),
          // //               //               Card(
          // //               //                 elevation: 2.0,
          // //               //                 color: Colors.grey[100],
          // //               //                 child: Container(
          // //               //                   width: 24,
          // //               //                   height: 24,
          // //               //                   alignment: Alignment.center,
          // //               //                   child: Text(
          // //               //                     "$i",
          // //               //                     textAlign: TextAlign.center,
          // //               //                   ),
          // //               //                 ),
          // //               //               ),
          // //               //               // SizedBox(
          // //               //               //   width: 1,
          // //               //               // ),
          // //               //               Card(
          // //               //                 color: Color.fromARGB(255, 209, 36, 36),
          // //               //                 child: Container(
          // //               //                   width: 24,
          // //               //                   height: 24,
          // //               //                   alignment: Alignment.center,
          // //               //                   child: Text(
          // //               //                     "$i",
          // //               //                     style: TextStyle(
          // //               //                       color: Colors.white,
          // //               //                     ),
          // //               //                     textAlign: TextAlign.center,
          // //               //                   ),
          // //               //                 ),
          // //               //               ),
          // //               //             ],
          // //               //           ),
          // //               //       ],
          // //               //     ),
          // //               //   ),
          // //             ],
          // //           ),
          // //         ),
          // //       ),
          // //       // ),
          // //       CheckboxListTile(
          // //         activeColor: Colors.pink[300],
          // //         dense: true,

          // //         title: new Text(
          // //           "Rasgele Yerleştirme",
          // //           style: TextStyle(fontSize: 12, letterSpacing: 0.5),
          // //         ),
          // //         value: true,
          // //         // secondary: Container(
          // //         //   height: 50,
          // //         //   width: 50,
          // //         //   child: Icon(
          // //         //     Icons.phone,
          // //         //   ),
          // //         // ),
          // //         onChanged: (val) {},
          // //       ),
          // //     ],
          // //   ),