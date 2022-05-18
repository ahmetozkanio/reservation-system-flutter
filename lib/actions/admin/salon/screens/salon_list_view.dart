import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../widgets/searchList.dart';
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
                    "GAUN",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.titleLarge!.fontSize),
                  ),
                  Text("Merkez Kutuphane")
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 32,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Obx(() => ElevatedButton(
                          //Baslangic Tarihi butonu
                          onPressed: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime
                                  .now(), //suanki zaman ile baslatiliyor.
                              maxTime: DateTime(2050, 12, 31),
                              onChanged: (date) {
                                _salonListController
                                        .salonMinBitisTarihiAndBaslangicCurrentDate
                                        .value =
                                    date; //Bitis Tarihi butonu tetikleniyor ve min zaman dilimi ayarlaniyor.
                                _salonListController
                                        .salonBaslangicTarihi.value =
                                    _salonListController.dateFormat(
                                        date); //Salon Baslangic tarihi formatlanip deger aliniyor. 2022-05-18
                              },
                              onConfirm: (date) {
                                _salonListController
                                        .salonMinBitisTarihiAndBaslangicCurrentDate
                                        .value =
                                    date; //Bitis Tarihi butonu tetikleniyor ve min zaman dilimi ayarlaniyor.
                                _salonListController
                                        .salonBaslangicTarihi.value =
                                    _salonListController.dateFormat(
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
                                style: TextStyle(fontSize: 9.0),
                              ),
                            ],
                          ),
                        )),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                    Obx(() => ElevatedButton(
                          //BitisTarihi Butonu
                          onPressed: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: _salonListController
                                  .salonMinBitisTarihiAndBaslangicCurrentDate
                                  .value,
                              maxTime: DateTime(2050, 12, 31),
                              onChanged: (date) {
                                print('confirm ');
                                _salonListController
                                        .salonBitisTarihiCurrentDate.value =
                                    date; //Bitis tarihi secilmis olan tarih.
                                _salonListController.salonBitisTarihi.value =
                                    _salonListController.dateFormat(
                                        date); // Tarihi formatlanip  String deger aliniyor. 2022-05-18

                                print(_salonListController
                                    .salonBitisTarihi.value);
                              },
                              onConfirm: (date) {
                                print('confirm ');
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
                                style: TextStyle(fontSize: 9.0),
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
                      () => ElevatedButton(
                        //Baslangic saati
                        onPressed: () {
                          DatePicker.showTimePicker(context,
                              showTitleActions: true,
                              // minTime: DateTime.now(),
                              // maxTime: DateTime(2022, 12, 31),
                              showSecondsColumn: false, onChanged: (date) {
                            _salonListController
                                    .salonMinBitisSaatiAndBaslangicCurrentTime
                                    .value =
                                date; //secilen saat degeri esitleniyor.
                            _salonListController.salonBaslangicSaati.value =
                                _salonListController
                                    .timeFormat(date); //String saat degerimiz.
                            print(
                                _salonListController.salonBaslangicSaati.value);
                          }, onConfirm: (date) {
                            print('confirm ');
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
                              style: TextStyle(fontSize: 9.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                    Obx(() => ElevatedButton(
                          //bitis saati
                          onPressed: () {
                            DatePicker.showTimePicker(context,
                                showTitleActions: true,
                                showSecondsColumn: false, onChanged: (date) {
                              _salonListController
                                      .salonBitisTarihiCurrentDate.value =
                                  date; //Bitis saati secili deger tekrar gozukmesi icin gerekli.
                              _salonListController.salonBitisSaati.value =
                                  _salonListController.timeFormat(
                                      date); //String saat degerimiz.
                            }, onConfirm: (date) {
                              print('confirm ');
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
                                style: TextStyle(fontSize: 9.0),
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
              bottom: 6.0,
            ),
            sliver: SliverToBoxAdapter(
              child: GFMultiSelect(
                size: GFSize.SMALL,
                items: ['Wifi', 'Priz'],
                onSelect: (value) {
                  print('selected $value ');
                },
                dropdownTitleTileTextStyle: TextStyle(
                  fontSize: 12,
                ),
                dropdownTitleTileMargin: const EdgeInsets.all(0.0),
                dropdownTitleTileText: 'Wifi, Priz ',
                // dropdownTitleTileMargin:
                //     EdgeInsets.only(top: 22, left: 18, right: 18, bottom: 5),
                // dropdownTitleTilePadding: EdgeInsets.all(10),
                dropdownUnderlineBorder:
                    const BorderSide(color: Colors.transparent, width: 2),
                dropdownTitleTileBorder: Border.all(
                    color: Color.fromARGB(255, 238, 238, 238), width: 1),
                dropdownTitleTileBorderRadius: BorderRadius.circular(5),
                expandedIcon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black54,
                ),
                collapsedIcon: const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.black54,
                ),
                submitButton: Text('Tamam'),
                cancelButton: Text('İptal'),

                // padding: const EdgeInsets.all(6),
                // margin: const EdgeInsets.all(6),
                type: GFCheckboxType.custom,
                activeBgColor: GFColors.SUCCESS,
                activeBorderColor: GFColors.SUCCESS,
                inactiveBorderColor: Color.fromARGB(255, 238, 238, 238),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 6.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  SizedBox(
                    height: 28.0,
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: searchTextField(
                      context,
                      searchOnChanged,
                      "Salon Ara",
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 218, 218, 218),
                      borderRadius: BorderRadius.all(Radius.elliptical(24, 24)),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: () {
                      _salonListController.isLoading.value
                          ? _salonListController.isLoading.value = false
                          : _salonListController.isLoading.value = true;
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 218, 218, 218),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(24, 24)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(
              12.0,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: salonCardGridViewCrossAxisCount(constraints),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: salonCardGridViewAspect(constraints),
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Obx(
                    () => _salonListController.isLoading.value
                        ? Shimmer.fromColors(
                            baseColor: Color.fromARGB(
                              255,
                              207,
                              207,
                              207,
                            ),
                            highlightColor: Color.fromARGB(255, 230, 229, 229),
                            child: salonCardShimmerContainer(context),
                          )
                        : FlipCard(
                            fill: Fill
                                .fillBack, // Fill the back side of the card to make in the same size as the front.
                            direction: FlipDirection.HORIZONTAL, // default
                            front: salonCardFront(index),
                            back: salonCardBack(
                              index,
                            ),
                          ),
                  );
                },
                childCount: 5,
              ),
            ),
          ),
        ],
      );
    }),
  );
}

Card salonCardBack(
  int index,
) {
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
                  'SALON ARKA $index',
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Fakulte Adi',
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
                      'SALON ON $index',
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
                      'Fakulte Adi',
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
                          'Rezervasyon:',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 11.0,
                          ),
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          '10:00 - 18/04/2022',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 11.0,
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
                          Icons.people_rounded,
                          color: Colors.grey[500],
                          size: 14.0,
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          'Akademisyen, Oğrenci',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0,
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
                  percent: 0.8,
                  animation: true,
                  animationDuration: 2000,
                  center: Text(
                    "80%",
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
                      () => ReservationView(),
                      transition: Transition.zoom,
                    );
                  },
                  child: Text(
                    'Rezervasyon',
                    style: TextStyle(
                      fontSize: 7.0,
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
