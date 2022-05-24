import 'package:dropdown_search/dropdown_search.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:library_reservation_liberta_flutter/actions/admin/birim/model/birim_model.dart';
import 'package:library_reservation_liberta_flutter/actions/admin/salon/api/salon_api.dart';
import 'package:library_reservation_liberta_flutter/actions/admin/salon/model/salon_ozellikleri_model.dart';
import 'package:library_reservation_liberta_flutter/widgets/shimmers/base_shimmer.dart';
import 'package:library_reservation_liberta_flutter/widgets/shimmers/drop_down_shimmer.dart';
import 'package:library_reservation_liberta_flutter/widgets/shimmers/multiselect_chipfield_shimmer.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../functions/date_time_format.dart';
import '../../../../widgets/date_picker_theme.dart';
import '../../../../widgets/searchList.dart';
import '../../../../widgets/shimmers/multiselect_dialogfield_shimmer.dart';
import '../../../rezervasyon/screens/reservation_view.dart';
import 'salon_list_controller.dart';

class SalonListView extends StatelessWidget {
  const SalonListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SalonListController _salonListController = Get.put(SalonListController());
    return salonListBody(context, _salonListController);
  }
}

dynamic searchOnChanged(value) {}
Container salonListBody(context, controller) {
  SalonListController _salonListController = Get.find();
  return Container(
    // decoration: pageBackgroundGradient(context),
    child: LayoutBuilder(builder: (context, constraints) {
      return CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(
              12.0,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SALONLAR",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.titleLarge!.fontSize),
                  ),
                  // Text("Salonlar")
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              bottom: 12.0,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Birimler",
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              bottom: 12.0,
            ),
            sliver: SliverToBoxAdapter(
              child: Obx(
                  () => _salonListController.salonOzellikleriLoading.value
                      ? baseShimmer(multiSelectDialogFieldShimmer())
                      : MultiSelectDialogField(
                          height: MediaQuery.of(context).size.height / 2,
                          title: Text('Birimler'),
                          buttonText: Text(
                            'Birim seçin',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          itemsTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          selectedItemsTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          buttonIcon: Icon(Icons.keyboard_arrow_down_sharp),
                          searchable: true,
                          searchHint: 'Birim ara',
                          confirmText: Text('Tamam'),
                          cancelText: Text('İptal'),
                          // barrierColor: Theme.of(context).primaryColor,
                          selectedColor: Theme.of(context).colorScheme.primary,
                          backgroundColor:
                              Theme.of(context).secondaryHeaderColor,
                          checkColor: Theme.of(context).secondaryHeaderColor,
                          items: _salonListController.birimMultiSelectList,
                          chipDisplay: MultiSelectChipDisplay(
                              scroll: true,
                              chipColor: Theme.of(context).colorScheme.primary,
                              textStyle: TextStyle(color: Colors.white)),
                          listType: MultiSelectListType.LIST,
                          onConfirm: (values) {
                            _salonListController.seciliBirimler =
                                values; //Degerler seciliBirimler listesine esitlenir
                            _salonListController
                                .secilmisBirimlerinAdlariBirlestirilmesi(); //seciliBirimler Listesindeki birimAdi lari  virgul ile birlestirip Tek Bir String Haline Getirilir
                            print(
                                _salonListController.secilmisBirimlerinAdlari);
                          },
                        )
                  //  DropdownSearch<dynamic>(
                  //     popupBackgroundColor:
                  //         Theme.of(context).secondaryHeaderColor,
                  //     mode: Mode.BOTTOM_SHEET,
                  //     // showSelectedItems: true,
                  //     showSearchBox: true,
                  //     items: _salonListController.birimNameList,
                  //     autoValidateMode: AutovalidateMode.onUserInteraction,
                  //     hint: "Birim Seçiniz",

                  //     onChanged: (data) {
                  //       _salonListController.seciliBirimName =
                  //           data; //Secili olan birim adimizi seciBirimName' e esitliyoruz.
                  //     },
                  //     validator: (value) {
                  //       if (value == null) {
                  //         return "Lütfen birim seçiniz.";
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              bottom: 6.0,
            ),
            sliver: SliverToBoxAdapter(
              child: Divider(
                thickness: 2.0,
              ),
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
              sliver: SliverToBoxAdapter(child: Text("Tarih ve saat"))),
          SliverPadding(
            padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
            sliver: SliverToBoxAdapter(
              child: Container(
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
                                _salonListController
                                        .salonMinBitisTarihiAndBaslangicCurrentDate
                                        .value =
                                    date; //Bitis Tarihi butonu tetikleniyor ve min zaman dilimi ayarlaniyor.
                                _salonListController
                                        .salonBaslangicTarihi.value =
                                    dateFormat(
                                        date); //Salon Baslangic tarihi formatlanip deger aliniyor. 2022-05-18
                              },
                              currentTime: _salonListController
                                  .salonMinBitisTarihiAndBaslangicCurrentDate
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
                                    _salonListController
                                        .salonBaslangicTarihi.value
                                        .toString(),
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                        )),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                    Obx(() => OutlinedButton(
                          //BitisTarihi Butonu
                          onPressed: () {
                            DatePicker.showDatePicker(
                              context,
                              theme: customDatePickerTheme(context),
                              showTitleActions: true,
                              minTime: _salonListController
                                  .salonMinBitisTarihiAndBaslangicCurrentDate
                                  .value,
                              maxTime: DateTime(2050, 12, 31),
                              onChanged: (date) {},
                              onConfirm: (date) {
                                _salonListController
                                        .salonBitisTarihiCurrentDate.value =
                                    date; //Bitis tarihi secilmis olan tarih.
                                _salonListController.salonBitisTarihi.value =
                                    dateFormat(
                                        date); // Tarihi formatlanip  String deger aliniyor. 2022-05-18
                              },
                              currentTime: _salonListController
                                  .salonBitisTarihiCurrentDate
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
                                    _salonListController.salonBitisTarihi.value,
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 6.0),
            sliver: SliverToBoxAdapter(
              child: Container(
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
                            _salonListController
                                    .salonMinBitisSaatiAndBaslangicCurrentTime
                                    .value =
                                date; //secilen saat degeri esitleniyor.
                            _salonListController.salonBaslangicSaati.value =
                                timeFormat(date); //String saat degerimiz.
                          },
                              currentTime: _salonListController
                                  .salonMinBitisSaatiAndBaslangicCurrentTime
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
                                  _salonListController
                                      .salonBaslangicSaati.value,
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                    Obx(() => OutlinedButton(
                          //bitis saati
                          onPressed: () {
                            DatePicker.showTimePicker(context,
                                showTitleActions: true,
                                showSecondsColumn: false,
                                theme: customDatePickerTheme(context),
                                onChanged: (date) {}, onConfirm: (date) {
                              _salonListController
                                      .salonBitisTarihiCurrentDate.value =
                                  date; //Bitis saati secili deger tekrar gozukmesi icin gerekli.
                              _salonListController.salonBitisSaati.value =
                                  timeFormat(date); //String saat degerimiz.
                            },
                                currentTime: _salonListController
                                            .salonBitisTarihiCurrentDate
                                            .value ==
                                        DateTime.now()
                                    ? _salonListController
                                        .salonMinBitisSaatiAndBaslangicCurrentTime
                                        .value // herhangi bir bitis saati secilmemis ise baslangic saatin secili degeri gelir.
                                    : _salonListController
                                        .salonBitisTarihiCurrentDate
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
                                    _salonListController.salonBitisSaati.value,
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
            ),
            sliver: SliverToBoxAdapter(
              child: Divider(
                thickness: 2.0,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 8.0,
              right: 12.0,
              bottom: 6.0,
            ),
            sliver: SliverToBoxAdapter(
                child: Obx(
              () => _salonListController.salonOzellikleriLoading.value
                  ? baseShimmer(multiSelectChhipFieldShimmer())
                  : MultiSelectChipField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (values) {
                        if (values == null || values.isEmpty) {
                          return "Salon özelliklerini seçiniz.";
                        }
                        return null;
                      },
                      textStyle: TextStyle(
                          fontSize: 12.0,
                          color: Theme.of(context).textTheme.bodyLarge?.color),
                      items:
                          _salonListController.salonOzellikleriMultiSelectList,
                      initialValue: [],
                      title: Text(
                        "Salon Özellikleri",
                        style: TextStyle(fontSize: 14.0),
                      ),
                      headerColor: Colors.transparent,
                      showHeader: true,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(15.0)),
                      ),
                      chipColor: Theme.of(context).scaffoldBackgroundColor,
                      selectedChipColor:
                          Theme.of(context).buttonTheme.colorScheme?.primary,
                      selectedTextStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      onTap: (values) {
                        _salonListController.secilmisSalonOzellikleri =
                            values; //secilen ozellikler listemize kayit edilir.
                        _salonListController
                            .secilmisSalonOzellikAdlariBirlestirilmesi();
                        // //her ozellik secildiginde String degiskenimiz bastan yenilenir.
                        print(_salonListController.secilmisSalonOzellikAdlari);
                      },
                    ),
            )),
          ),
          SliverPadding(
              padding: EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                bottom: 6.0,
              ),
              sliver: SliverToBoxAdapter(
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        'Salon Ara',
                      ),
                    ],
                  ),
                  onPressed: () {
                    _salonListController.fetchSalonList();
                  },
                ),
              )),
          // SliverPadding(
          //   padding: EdgeInsets.only(bottom: 6.0),
          //   sliver: SliverToBoxAdapter(
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           height: 28.0,
          //           width: MediaQuery.of(context).size.width / 1.3,
          //           child: searchTextField(
          //             context,
          //             searchOnChanged,
          //             "Salon Ara",
          //           ),
          //         ),
          //         Container(
          //           width: 24,
          //           height: 24,
          //           decoration: BoxDecoration(
          //             color: Color.fromARGB(255, 218, 218, 218),
          //             borderRadius: BorderRadius.all(Radius.elliptical(24, 24)),
          //           ),
          //         ),
          //         SizedBox(
          //           width: 4,
          //         ),
          //         InkWell(
          //           onTap: () {
          //             _salonListController.salonListLoading.value
          //                 ? _salonListController.salonListLoading.value = false
          //                 : _salonListController.salonListLoading.value = true;
          //           },
          //           child: Container(
          //             width: 24,
          //             height: 24,
          //             decoration: BoxDecoration(
          //               color: Color.fromARGB(255, 218, 218, 218),
          //               borderRadius:
          //                   BorderRadius.all(Radius.elliptical(24, 24)),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 48.0,
            ),
            sliver: Obx(
              () => _salonListController.salonAramaLoading.value
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
                                "Salonları listelemek icin arama yapiniz.",
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
                  : Obx(() => _salonListController.salonListLoading.value
                      ? SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                salonCardGridViewCrossAxisCount(constraints),
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                            childAspectRatio:
                                salonCardGridViewAspect(constraints),
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return baseShimmer(
                                  salonCardShimmerContainer(context));
                            },
                            childCount: 2,
                          ),
                        )
                      : SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                salonCardGridViewCrossAxisCount(constraints),
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                            childAspectRatio:
                                salonCardGridViewAspect(constraints),
                          ),
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return FlipCard(
                              fill: Fill.fillBack,
                              direction: FlipDirection.HORIZONTAL,
                              front: salonCardFront(index),
                              back: salonCardBack(
                                index,
                              ),
                            );
                          }, childCount: _salonListController.salonList.length),
                        )),
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(bottom: 64.0))
        ],
      );
    }),
  );
}

Card salonCardBack(
  int index,
) {
  SalonListController _salonListController = Get.find();
  return Card(
    elevation: 3.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        11.0,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            11,
          ),
        ),
      ),
      width: double.minPositive,
      height: double.infinity,
      padding: EdgeInsets.all(
        12.0,
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _salonListController.salonList[index].salonAdi ?? '',
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  _salonListController.salonList[index].birimAdi ?? '',
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Birim Adi',
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      color: Colors.grey[500],
                      size: 14.0,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      'Sadece gunluk rezervasyon yapilabilir.',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people_rounded,
                      color: Colors.grey[500],
                      size: 14.0,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      'Rezervasyon Yapabilen Kullanicilar: Akademisyen, Oğrenci',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.grey[500],
                      size: 14.0,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      '0538 396 4617 - 0342 227 0784',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 11.0,
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.navigation_rounded,
                      color: Colors.grey[500],
                      size: 14.0,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      'Salon adresi ve navigation link.',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Card salonCardFront(int index) {
  SalonListController _salonListController = Get.find();
  return Card(
    elevation: 3.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        11,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            11,
          ),
        ),
      ),
      // width: double.infinity,
      // height: double.infinity,
      padding: EdgeInsets.all(
        12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _salonListController.salonList[index].salonAdi ?? '',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      _salonListController.salonList[index].birimAdi ?? '',
                      style: TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),

                //
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rezervasyon',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 11.0,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: Colors.grey[500],
                          size: 14.0,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          'Tarih :',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 11.0,
                          ),
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Flexible(
                          child: Text(
                            _salonListController
                                    .salonList[index].rezervasyonBaslangicTarihi
                                    .toString() +
                                ' / ' +
                                _salonListController
                                    .salonList[index].rezervasyonBitisTarihi
                                    .toString(),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            maxLines: 3,
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.grey[500],
                          size: 14.0,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          'Saat : ',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 11.0,
                          ),
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Flexible(
                          child: Text(
                            _salonListController
                                    .salonList[index].rezervasyonBaslangicSaati
                                    .toString() +
                                ' / ' +
                                _salonListController
                                    .salonList[index].rezervasyonBitisSaati
                                    .toString(),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            maxLines: 3,
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.people_rounded,
                          color: Colors.grey[500],
                          size: 14.0,
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          _salonListController.salonList[index].salonKapasitesi
                              .toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.wifi,
                          color: Colors.grey[500],
                          size: 14.0,
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Icon(
                          Icons.electrical_services,
                          color: Colors.grey[500],
                          size: 14.0,
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Icon(
                          Icons.desktop_mac,
                          color: Colors.grey[500],
                          size: 14.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularPercentIndicator(
                  radius: 32.0,
                  lineWidth: 7.0,
                  percent: _salonListController
                              .salonList[index].salonKapasitesiYuzde !=
                          null
                      ? _salonListController
                              .salonList[index].salonKapasitesiYuzde! *
                          0.01
                      : 0.0,
                  animation: true,
                  animationDuration: 3000,
                  center: Text(
                    _salonListController.salonList[index].salonKapasitesiYuzde
                        .toString(),
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                  progressColor: Colors.green,
                  backgroundColor: Colors.grey[300]!,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(
                      () => ReservationView(
                          _salonListController.salonList[index]),
                      transition: Transition.zoom,
                    );
                  },
                  child: Text(
                    'Rezervasyon',
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Container salonCardShimmerContainer(context) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(width: 1.0, color: const Color(0xFFFFFFFF)),
      borderRadius: BorderRadius.all(
        Radius.circular(
          11,
        ),
      ),
    ),
    width: double.infinity,
    height: double.infinity,
    padding: EdgeInsets.all(
      12.0,
    ),
    child: Stack(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.56,
                height: 12,
                color: Colors.white,
              ),
              SizedBox(
                height: 4.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.44,
                height: 12,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: 12,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.24,
                    height: 12,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.24,
                    height: 12,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: CircularPercentIndicator(
            radius: 32.0,
            lineWidth: 7.0,
            percent: 0.8,
            animation: true,
            animationDuration: 2000,
            progressColor: Colors.green,
            backgroundColor: Colors.grey[300]!,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            width: 96,
            height: 32,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

double salonCardGridViewAspect(BoxConstraints constraints) {
  if (constraints.maxWidth > 1200) {
    return 2.0;
  } else if (constraints.maxWidth > 964) {
    return 3.0;
  } else if (constraints.maxWidth > 888) {
    return 2.4;
  } else if (constraints.maxWidth > 828) {
    return 2.0;
  } else if (constraints.maxWidth > 728) {
    return 1.8;
  } else if (constraints.maxWidth > 658) {
    return 1.6;
  } else if (constraints.maxWidth > 600) {
    return 3.0;
  } else if (constraints.maxWidth > 458) {
    return 2.5;
  }
  return 2.0;
}

int salonCardGridViewCrossAxisCount(BoxConstraints constraints) {
  if (constraints.maxWidth > 1200) {
    return 3;
  } else if (constraints.maxWidth > 658) {
    return 2;
  }
  return 1;
}
